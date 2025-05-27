from behave import given, when, then
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.chrome.options import Options
from webdriver_manager.chrome import ChromeDriverManager
import requests

@given('the OECD Analytics Platform is running')
def step_platform_running(context):
    # Check if the platform is running
    try:
        response = requests.get('http://localhost', timeout=5)
        assert response.status_code == 200
    except:
        raise Exception("Platform is not running")

@given('I am on the login page')
def step_on_login_page(context):
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    context.driver = webdriver.Chrome(
        service=webdriver.chrome.service.Service(ChromeDriverManager().install()),
        options=chrome_options
    )
    context.driver.get('http://localhost')

@given('I have valid credentials')
def step_valid_credentials(context):
    context.username = 'bundesdruckerei'
    context.password = 'demo123'

@given('I have invalid credentials')
def step_invalid_credentials(context):
    context.username = 'wrong_user'
    context.password = 'wrong_password'

@when('I enter "{username}" as username')
def step_enter_username(context, username):
    username_field = context.driver.find_element(By.ID, "username")
    username_field.send_keys(username)

@when('I enter "{password}" as password')
def step_enter_password(context, password):
    password_field = context.driver.find_element(By.ID, "password")
    password_field.send_keys(password)

@when('I click the login button')
def step_click_login(context):
    login_button = context.driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
    login_button.click()

@when('I click the login button without entering credentials')
def step_click_login_empty(context):
    login_button = context.driver.find_element(By.CSS_SELECTOR, "button[type='submit']")
    login_button.click()

@then('I should be redirected to the dashboard')
def step_redirected_to_dashboard(context):
    WebDriverWait(context.driver, 10).until(
        EC.presence_of_element_located((By.CLASS_NAME, "dashboard"))
    )

@then('I should see "{text}" on the page')
def step_see_text(context, text):
    assert text in context.driver.page_source

@then('I should see an error message')
def step_see_error_message(context):
    WebDriverWait(context.driver, 5).until(
        EC.presence_of_element_located((By.CLASS_NAME, "error"))
    )

@then('I should remain on the login page')
def step_remain_on_login(context):
    # Check if still on login page
    username_field = context.driver.find_element(By.ID, "username")
    assert username_field.is_displayed()

@then('I should see validation errors')
def step_see_validation_errors(context):
    # This would check for HTML5 validation or custom validation messages
    username_field = context.driver.find_element(By.ID, "username")
    assert username_field.get_attribute("required") is not None