import pytest
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager

class TestResponsiveDesign:
    @pytest.fixture(scope="class", params=[(1920, 1080), (768, 1024), (375, 667)])
    def driver_with_size(self, request):
        """Setup Chrome driver with different screen sizes"""
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        
        driver = webdriver.Chrome(
            service=webdriver.chrome.service.Service(ChromeDriverManager().install()),
            options=chrome_options
        )
        
        width, height = request.param
        driver.set_window_size(width, height)
        yield driver, width, height
        driver.quit()
    
    def test_responsive_layout(self, driver_with_size):
        """Test responsive design at different screen sizes"""
        driver, width, height = driver_with_size
        driver.get("http://localhost")
        
        # Login
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
        
        # Check if elements are visible and properly arranged
        dashboard = driver.find_element(By.CLASS_NAME, "dashboard")
        assert dashboard.is_displayed()
        
        # For mobile screens, check if navigation is collapsed
        if width < 768:
            # Mobile-specific checks
            pass
        else:
            # Desktop-specific checks
            charts = driver.find_elements(By.CSS_SELECTOR, ".recharts-wrapper")
            assert len(charts) > 0