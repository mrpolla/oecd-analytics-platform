import pytest
import psycopg2
import requests
import time
from unittest.mock import patch

class TestAPIDatabase:
    @pytest.fixture(scope="class")
    def db_connection(self):
        """Create database connection for tests"""
        conn = psycopg2.connect(
            host="oecd-postgres",
            port=5432,
            database="oecd_analytics",
            user="oecd_user",
            password="oecd_password"
        )
        yield conn
        conn.close()
    
    def test_database_connection(self, db_connection):
        """Test database connectivity"""
        cursor = db_connection.cursor()
        cursor.execute("SELECT 1")
        result = cursor.fetchone()
        assert result[0] == 1
        cursor.close()
    
    def test_api_database_integration(self, db_connection):
        """Test API-database integration"""
        # Insert test data
        cursor = db_connection.cursor()
        cursor.execute("""
            INSERT INTO oecd_productivity (country_code, country_name, industry, year, productivity_index)
            VALUES ('TEST', 'Test Country', 'Manufacturing', 2023, 100.0)
            ON CONFLICT DO NOTHING
        """)
        db_connection.commit()
        
        # Test API endpoint
        login_response = requests.post(
            "http://localhost:8000/auth/login",
            data={"username": "bundesdruckerei", "password": "demo123"}
        )
        token = login_response.json()["access_token"]
        
        response = requests.get(
            "http://localhost:8000/productivity/TEST",
            headers={"Authorization": f"Bearer {token}"}
        )
        
        assert response.status_code == 200
        data = response.json()
        assert len(data) > 0
        assert data[0]["country_code"] == "TEST"
        
        # Cleanup
        cursor.execute("DELETE FROM oecd_productivity WHERE country_code = 'TEST'")
        db_connection.commit()
        cursor.close()