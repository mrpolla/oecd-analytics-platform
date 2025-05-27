import pytest
import sys
import os
import requests
sys.path.append(os.path.join(os.path.dirname(__file__), '../../microservices/api'))

class TestAPIEndpoints:
    def test_health_endpoint(self):
        """Test health check endpoint"""
        response = requests.get("http://oecd-api:8000/health")
        assert response.status_code == 200
        data = response.json()
        assert data["status"] == "healthy"
    
    # def test_login_endpoint_valid(self):
    #     """Test login with valid credentials"""
    #     response = client.post(
    #         "/auth/login",
    #         data={"username": "bundesdruckerei", "password": "demo123"}
    #     )
    #     assert response.status_code == 200
    #     assert "access_token" in response.json()
    #     assert response.json()["token_type"] == "bearer"
    
    # def test_login_endpoint_invalid(self):
    #     """Test login with invalid credentials"""
    #     response = client.post(
    #         "/auth/login",
    #         data={"username": "wrong", "password": "wrong"}
    #     )
    #     assert response.status_code == 401
    
    # def test_protected_endpoint_without_token(self):
    #     """Test accessing protected endpoint without token"""
    #     response = client.get("/countries")
    #     assert response.status_code == 401
    
    # def test_protected_endpoint_with_token(self):
    #     """Test accessing protected endpoint with valid token"""
    #     # First login to get token
    #     login_response = client.post(
    #         "/auth/login",
    #         data={"username": "bundesdruckerei", "password": "demo123"}
    #     )
    #     token = login_response.json()["access_token"]
        
    #     # Use token to access protected endpoint
    #     response = client.get(
    #         "/countries",
    #         headers={"Authorization": f"Bearer {token}"}
    #     )
    #     assert response.status_code == 200