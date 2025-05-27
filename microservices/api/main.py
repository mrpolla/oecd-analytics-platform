"""
OECD Analytics API Microservice
"""
from fastapi import FastAPI, HTTPException, Query, Depends, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import Response
from jose import JWTError, jwt
from passlib.context import CryptContext
from datetime import datetime, timedelta
from typing import List, Optional
from pydantic import BaseModel
import psycopg2
from psycopg2.extras import RealDictCursor
import os
import time
from prometheus_client import Counter, Histogram, generate_latest, CONTENT_TYPE_LATEST
from prometheus_fastapi_instrumentator import Instrumentator
from fastapi.security import HTTPBearer, HTTPAuthorizationCredentials
from dotenv import load_dotenv

# Security
security = HTTPBearer()
SECRET_KEY = os.getenv("SECRET_KEY", "your-secret-key-change-this")
ALGORITHM = "HS256"

# Login model
class LoginForm(BaseModel):
    username: str
    password: str

def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    """Create JWT token"""
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(hours=24)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

def verify_token(credentials: HTTPAuthorizationCredentials = Depends(security)):
    """Verify JWT token"""
    token = credentials.credentials
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        return payload
    except jwt.ExpiredSignatureError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Token has expired"
        )
    except jwt.JWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Could not validate credentials"
        )

# Load environment variables
load_dotenv()

# Create FastAPI app
app = FastAPI(
    title="OECD Analytics API",
    description="API for accessing OECD productivity and economic data",
    version="1.0.0"
)

instrumentator = Instrumentator()
instrumentator.instrument(app).expose(app)

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_db_connection():
    """Create database connection"""
    return psycopg2.connect(
        host=os.getenv("POSTGRES_HOST"),
        port=os.getenv("POSTGRES_PORT"),
        database=os.getenv("POSTGRES_DB"),
        user=os.getenv("POSTGRES_USER"),
        password=os.getenv("POSTGRES_PASSWORD"),
        cursor_factory=RealDictCursor
    )

# Add the login endpoint
@app.post("/auth/login")
def login(username: str = Query(...), password: str = Query(...)):
    """Login endpoint"""
    if username == "bundesdruckerei" and password == "demo123":
        access_token = create_access_token(data={"sub": username})
        return {"access_token": access_token, "token_type": "bearer"}
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Incorrect username or password"
    )

@app.get("/")
def read_root():
    """Root endpoint"""
    return {
        "message": "OECD Analytics API",
        "endpoints": [
            "/docs",
            "/countries",
            "/industries",
            "/productivity/{country_code}",
            "/productivity/compare",
            "/trends/{country_code}",
            "/health",
            "/ready"
        ]
    }

@app.get("/countries")
def get_countries():
    """Get list of available countries"""
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT DISTINCT country_code, country_name 
                FROM oecd_productivity 
                ORDER BY country_name
            """)
            return cur.fetchall()
    finally:
        conn.close()

@app.get("/industries")
def get_industries():
    """Get list of industries"""
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT DISTINCT industry_code, industry_name 
                FROM oecd_productivity 
                WHERE industry_code != '_T'
                ORDER BY industry_name
            """)
            return cur.fetchall()
    finally:
        conn.close()

@app.get("/productivity/compare")
def compare_productivity(
    countries: str = Query(..., description="Comma-separated country codes"),
    industry: str = "ATU",
    metric: str = "index"
):
    """Compare productivity across multiple countries"""
    country_list = [c.strip().upper() for c in countries.split(",")]
    
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            if metric == "index":
                transformation = "_Z"
            else:
                transformation = "GY"
            
            cur.execute("""
                SELECT country_code, country_name, year, value
                FROM oecd_productivity 
                WHERE country_code = ANY(%s)
                AND industry_code = %s
                AND transformation = %s
                ORDER BY country_name, year
            """, (country_list, industry, transformation))
            
            results = cur.fetchall()
            
            if not results:
                raise HTTPException(status_code=404, detail="No data found for specified countries")
            
            # Group by country
            comparison = {}
            for row in results:
                if row['country_name'] not in comparison:
                    comparison[row['country_name']] = []
                comparison[row['country_name']].append({
                    'year': row['year'],
                    'value': float(row['value'])
                })
            
            return comparison
    finally:
        conn.close()

@app.get("/productivity/{country_code}")
def get_country_productivity(
    country_code: str,
    industry: Optional[str] = None,
    year: Optional[int] = None
):
    """Get productivity data for a specific country"""
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            query = """
                SELECT country_name, industry_name, year, value, unit, transformation
                FROM oecd_productivity 
                WHERE country_code = %s
            """
            params = [country_code.upper()]
            
            if industry:
                query += " AND industry_code = %s"
                params.append(industry)
            
            if year:
                query += " AND year = %s"
                params.append(year)
            
            query += " ORDER BY year DESC, industry_name"
            
            cur.execute(query, params)
            results = cur.fetchall()
            
            if not results:
                raise HTTPException(status_code=404, detail=f"No data found for country {country_code}")
            
            return results
    finally:
        conn.close()

@app.get("/trends/{country_code}")
def get_productivity_trends(country_code: str, industry: str = "ATU"):
    """Get productivity trends for a country"""
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            # Get both index and growth rate
            cur.execute("""
                SELECT year, transformation, value, industry_name
                FROM oecd_productivity 
                WHERE country_code = %s
                AND industry_code = %s
                ORDER BY year, transformation
            """, (country_code.upper(), industry))
            
            results = cur.fetchall()
            
            if not results:
                raise HTTPException(status_code=404, detail=f"No data found for country {country_code}")
            
            # Organize by transformation type
            trends = {
                'country': country_code,
                'industry': results[0]['industry_name'] if results else '',
                'index_values': [],
                'growth_rates': []
            }
            
            for row in results:
                data_point = {'year': row['year'], 'value': float(row['value'])}
                if row['transformation'] == '_Z':
                    trends['index_values'].append(data_point)
                else:
                    trends['growth_rates'].append(data_point)
            
            return trends
    finally:
        conn.close()

@app.get("/summary/germany")
def get_germany_summary():
    """Special endpoint for Germany (Bundesdruckerei use case)"""
    conn = get_db_connection()
    try:
        with conn.cursor() as cur:
            # Get Germany's overall productivity
            cur.execute("""
                SELECT 
                    industry_name,
                    value as productivity_index,
                    transformation
                FROM oecd_productivity 
                WHERE country_code = 'DEU'
                AND year = 2023
                AND transformation = '_Z'
                ORDER BY value DESC
            """)
            productivity = cur.fetchall()
            
            # Get growth rates
            cur.execute("""
                SELECT 
                    industry_name,
                    value as growth_rate
                FROM oecd_productivity 
                WHERE country_code = 'DEU'
                AND year = 2023
                AND transformation = 'GY'
                ORDER BY value DESC
            """)
            growth = cur.fetchall()
            
            # Compare with EU average
            cur.execute("""
                SELECT 
                    AVG(value) as eu_average
                FROM oecd_productivity 
                WHERE country_code IN ('FRA', 'ITA', 'ESP', 'NLD', 'BEL', 'AUT')
                AND year = 2023
                AND industry_code = 'ATU'
                AND transformation = '_Z'
            """)
            eu_avg = cur.fetchone()
            
            return {
                'country': 'Germany',
                'year': 2023,
                'productivity_by_industry': productivity[:10],  # Top 10
                'growth_rates': growth[:10],
                'comparison': {
                    'germany_overall': next((p['productivity_index'] for p in productivity if 'Total' in p['industry_name']), None),
                    'eu_average': round(eu_avg['eu_average'], 2) if eu_avg else None
                }
            }
    finally:
        conn.close()

@app.get("/health")
async def health_check():
    """Health check endpoint for monitoring"""
    try:
        # Check database connectivity
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT 1")
        cursor.fetchone()
        cursor.close()
        conn.close()
        
        return {
            "status": "healthy",
            "timestamp": datetime.utcnow().isoformat(),
            "version": "1.0.0",
            "database": "connected"
        }
    except Exception as e:
        raise HTTPException(
            status_code=503,
            detail=f"Service unhealthy: {str(e)}"
        )

@app.get("/ready")
async def readiness_check():
    """Readiness check for Kubernetes/container orchestration"""
    try:
        # Check if all dependencies are ready
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT COUNT(*) FROM oecd_productivity")
        count = cursor.fetchone()[0]
        cursor.close()
        conn.close()
        
        if count > 0:
            return {"status": "ready", "data_count": count}
        else:
            raise HTTPException(status_code=503, detail="No data available")
    except Exception as e:
        raise HTTPException(
            status_code=503,
            detail=f"Service not ready: {str(e)}"
        )
    
if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)