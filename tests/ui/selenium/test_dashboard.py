import pytest
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import time

class TestDashboard:
    @pytest.fixture(scope="class")
    def driver(self):
        """Setup Chrome driver for tests"""
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--window-size=1920,1080")
        
        driver = webdriver.Chrome(
            service=webdriver.chrome.service.Service(ChromeDriverManager().install()),
            options=chrome_options
        )
        driver.implicitly_wait(10)
        yield driver
        driver.quit()
    
    def test_login_page_loads(self, driver):
        """Test login page loads correctly"""
        driver.get("http://localhost")
        
        # Check page title
        assert "OECD Analytics" in driver.title
        
        # Check login form elements
        username_field = driver.find_element(By.ID, "username")
        password_field = driver.find_element(By.ID, "password")
        login_button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
        
        assert username_field.is_displayed()
        assert password_field.is_displayed()
        assert login_button.is_displayed()
    
    def test_successful_login(self, driver):
        """Test successful login flow"""
        driver.get("http://localhost")
        
        # Fill login form
        username_field = driver.find_element(By.ID, "username")
        password_field = driver.find_element(By.ID, "password")
        login_button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
        
        username_field.send_keys("bundesdruckerei")
        password_field.send_keys("demo123")
        login_button.click()
        
        # Wait for dashboard to load
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "dashboard"))
        )
        
        # Check dashboard elements
        assert "Dashboard" in driver.page_source
        assert "Productivity Analysis" in driver.page_source
    
    def test_failed_login(self, driver):
        """Test failed login with invalid credentials"""
        driver.get("http://localhost")
        
        # Fill login form with wrong credentials
        username_field = driver.find_element(By.ID, "username")
        password_field = driver.find_element(By.ID, "password")
        login_button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
        
        username_field.send_keys("wrong_user")
        password_field.send_keys("wrong_password")
        login_button.click()
        
        # Check for error message
        WebDriverWait(driver, 5).until(
            EC.presence_of_element_located((By.CLASS_NAME, "error"))
        )
        
        assert "Invalid credentials" in driver.page_source
    
    def test_dashboard_charts_load(self, driver):
        """Test dashboard charts load correctly"""
        # First login
        driver.get("http://localhost")
        username_field = driver.find_element(By.ID, "username")
        password_field = driver.find_element(By.ID, "password")
        login_button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
        
        username_field.send_keys("bundesdruckerei")
        password_field.send_keys("demo123")
        login_button.click()
        
        # Wait for dashboard
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "dashboard"))
        )
        
        # Check for charts
        charts = driver.find_elements(By.CSS_SELECTOR, ".recharts-wrapper")
        assert len(charts) > 0
        
        # Check country selector
        country_selector = driver.find_element(By.CSS_SELECTOR, "select")
        assert country_selector.is_displayed()
    
    def test_country_comparison(self, driver):
        """Test country comparison functionality"""
        # Login first
        driver.get("http://localhost")
        username_field = driver.find_element(By.ID, "username")
        password_field = driver.find_element(By.ID, "password")
        login_button = driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
        
        username_field.send_keys("bundesdruckerei")
        password_field.send_keys("demo123")
        login_button.click()
        
        # Wait for dashboard
        WebDriverWait(driver, 10).until(
            EC.presence_of_element_located((By.CLASS_NAME, "dashboard"))
        )
        
        # Select countries for comparison
        country_selector = driver.find_element(By.CSS_SELECTOR, "select")
        country_selector.click()
        
        # Select Germany option
        germany_option = driver.find_element(By.CSS_SELECTOR, "option[value='DEU']")
        germany_option.click()
        
        # Wait for chart update
        time.sleep(2)
        
        # Verify chart updated with Germany data
        assert "Germany" in driver.page_source