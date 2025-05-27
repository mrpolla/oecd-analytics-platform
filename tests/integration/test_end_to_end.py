import pytest
import requests
import time

class TestEndToEnd:
    def test_complete_data_flow(self):
        """Test complete data flow from OECD to API"""
        # Wait for services to be ready
        time.sleep(10)
        
        # Test MinIO is accessible
        minio_response = requests.get("http://oecd-minio:9000/minio/health/ready")
        assert minio_response.status_code == 200
        
        # Test database has data
        login_response = requests.post(
            "http://oecd-api:8000/auth/login",
            params={"username": "bundesdruckerei", "password": "demo123"}
        )
        assert login_response.status_code == 200
        token = login_response.json()["access_token"]
        
        # Test API returns data
        countries_response = requests.get(
            "http://oecd-api:8000/countries",
            headers={"Authorization": f"Bearer {token}"}
        )
        assert countries_response.status_code == 200
        assert len(countries_response.json()) > 0