import pytest
import pandas as pd
import json
from unittest.mock import patch, MagicMock
import sys
import os
sys.path.append(os.path.join(os.path.dirname(__file__), '../../etl'))

from process_oecd_productivity import process_oecd_data, validate_data

class TestETLProcessing:
    def test_validate_data_valid(self):
        """Test data validation with valid data"""
        valid_data = [
            {
                "Country": "Germany",
                "LOCATION": "DEU",
                "SUBJECT": "TOT_INDUST",
                "TIME": 2023,
                "Value": 100.5
            }
        ]
        result = validate_data(valid_data)
        assert result is True
    
    def test_validate_data_missing_fields(self):
        """Test data validation with missing required fields"""
        invalid_data = [
            {
                "Country": "Germany",
                "LOCATION": "DEU"
                # Missing required fields
            }
        ]
        result = validate_data(invalid_data)
        assert result is False
    
    def test_validate_data_invalid_values(self):
        """Test data validation with invalid values"""
        invalid_data = [
            {
                "Country": "Germany",
                "LOCATION": "DEU",
                "SUBJECT": "TOT_INDUST",
                "TIME": "invalid_year",  # Should be integer
                "Value": "invalid_value"  # Should be numeric
            }
        ]
        result = validate_data(invalid_data)
        assert result is False
    
    @patch('psycopg2.connect')
    def test_process_oecd_data(self, mock_connect):
        """Test OECD data processing"""
        # Mock database connection
        mock_conn = MagicMock()
        mock_cursor = MagicMock()
        mock_connect.return_value = mock_conn
        mock_conn.cursor.return_value = mock_cursor
        
        # Test data
        test_data = [
            {
                "Country": "Germany",
                "LOCATION": "DEU",
                "SUBJECT": "TOT_INDUST",
                "TIME": 2023,
                "Value": 100.5
            }
        ]
        
        result = process_oecd_data(test_data)
        assert result is True
        
        # Verify database operations
        mock_cursor.execute.assert_called()
        mock_conn.commit.assert_called()