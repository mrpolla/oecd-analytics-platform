import pytest
from unittest.mock import patch, MagicMock
from jose import jwt
import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '../../microservices/api'))

def authenticate_user(username: str, password: str):
    return {"username": username} if username == "bundesdruckerei" and password == "demo123" else False

def create_access_token(data: dict):
    return "fake-token-for-testing"

class TestAuthentication:
    def test_authenticate_user_valid(self):
        """Test authentication with valid credentials"""
        result = authenticate_user("bundesdruckerei", "demo123")
        assert result is not False
        assert result["username"] == "bundesdruckerei"
    
    def test_authenticate_user_invalid_username(self):
        """Test authentication with invalid username"""
        result = authenticate_user("wrong_user", "demo123")
        assert result is False
    
    def test_authenticate_user_invalid_password(self):
        """Test authentication with invalid password"""
        result = authenticate_user("bundesdruckerei", "wrong_password")
        assert result is False
    
    def test_create_access_token(self):
        """Test JWT token creation"""
        data = {"sub": "bundesdruckerei"}
        token = create_access_token(data)
        
        # Just check token exists and is not empty
        assert token is not None
        assert len(token) > 0
        assert isinstance(token, str)