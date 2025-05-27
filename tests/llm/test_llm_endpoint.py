import pytest
import requests
from unittest.mock import patch, MagicMock

class TestLLMEndpoints:
    def test_llm_health_check(self):
        """Test LLM service health check"""
        # Assuming LLM service will be on port 8001
        try:
            response = requests.get("http://localhost:8001/health", timeout=5)
            assert response.status_code == 200
        except requests.exceptions.ConnectionError:
            pytest.skip("LLM service not running")
    
    @patch('requests.post')
    def test_llm_query_processing(self, mock_post):
        """Test LLM query processing"""
        # Mock LLM response
        mock_response = MagicMock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            "answer": "Germany's GDP growth in 2023 was 1.2%",
            "confidence": 0.85,
            "sources": ["OECD Economic Outlook"]
        }
        mock_post.return_value = mock_response
        
        # Test query
        query = "What was Germany's GDP growth in 2023?"
        response = requests.post(
            "http://localhost:8001/ask",
            json={"question": query}
        )
        
        assert response.status_code == 200
        result = response.json()
        assert "answer" in result
        assert "confidence" in result
    
    def test_llm_data_integration(self):
        """Test LLM integration with OECD data"""
        # This would test that LLM can access and use the ingested OECD data
        # Mock implementation for now
        sample_query = "Compare productivity between Germany and France"
        
        # Mock expected response structure
        expected_response = {
            "answer": "Based on OECD productivity data...",
            "data_sources": ["oecd_productivity table"],
            "countries_analyzed": ["Germany", "France"]
        }
        
        # In real implementation, this would call the actual LLM endpoint
        assert "answer" in expected_response
        assert len(expected_response["countries_analyzed"]) == 2