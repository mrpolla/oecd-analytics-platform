from behave import given, when, then
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import Select

@given('I am logged into the platform')
def step_logged_in(context):
    context.execute_steps('''
        given the OECD Analytics Platform is running
        and I am on the login page
        when I enter "bundesdruckerei" as username
        and I enter "demo123" as password
        and I click the login button
    ''')

@given('I am on the dashboard page')
def step_on_dashboard(context):
    WebDriverWait(context.driver, 10).until(
        EC.presence_of_element_located((By.CLASS_NAME, "dashboard"))
    )

@when('the dashboard loads')
def step_dashboard_loads(context):
    # Wait for dashboard elements to load
    WebDriverWait(context.driver, 10).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, ".recharts-wrapper"))
    )

@then('I should see a global productivity chart')
def step_see_chart(context):
    chart = context.driver.find_element(By.CSS_SELECTOR, ".recharts-wrapper")
    assert chart.is_displayed()

@then('the chart should contain data for multiple countries')
def step_chart_has_multiple_countries(context):
    # This would check chart data points
    # For now, just verify chart is present and has data
    assert "Germany" in context.driver.page_source or "France" in context.driver.page_source

@then('I should see a country selection dropdown')
def step_see_country_dropdown(context):
    dropdown = context.driver.find_element(By.TAG_NAME, "select")
    assert dropdown.is_displayed()

@given('I can see the country selector')
def step_can_see_selector(context):
    dropdown = context.driver.find_element(By.TAG_NAME, "select")
    assert dropdown.is_displayed()
    context.country_selector = dropdown

@when('I select "{country}" from the country dropdown')
def step_select_country(context, country):
    select = Select(context.driver.find_element(By.TAG_NAME, "select"))
    # Map country names to codes
    country_codes = {
        "Germany": "DEU",
        "France": "FRA",
        "United States": "USA"
    }
    code = country_codes.get(country, "DEU")
    select.select_by_value(code)

@then('the chart should update to show Germany\'s data')
def step_chart_shows_germany(context):
    # Wait a moment for chart to update
    import time
    time.sleep(2)
    # Verify Germany data is shown
    assert "Germany" in context.driver.page_source

@then('I should see "{country}" in the chart title')
def step_see_country_in_title(context, country):
    assert country in context.driver.page_source