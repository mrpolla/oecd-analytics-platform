from behave import given, when, then
import requests

@given('the API is running')
def step_api_running(context):
    try:
        response = requests.get('http://localhost:8000/health', timeout=5)
        assert response.status_code == 200
    except:
        raise Exception("API is not running")

@given('the database contains OECD data')
def step_database_has_data(context):
    # This would verify database has data
    # For now, assume it's populated from previous steps
    pass

@given('I have a valid authentication token')
def step_have_auth_token(context):
    response = requests.post(
        'http://localhost:8000/auth/login',
        data={'username': 'bundesdruckerei', 'password': 'demo123'}
    )
    assert response.status_code == 200
    context.token = response.json()['access_token']

@when('I request the list of countries')
def step_request_countries(context):
    # First get token
    login_response = requests.post(
        'http://localhost:8000/auth/login',
        data={'username': 'bundesdruckerei', 'password': 'demo123'}
    )
    token = login_response.json()['access_token']
    
    context.response = requests.get(
        'http://localhost:8000/countries',
        headers={'Authorization': f'Bearer {token}'}
    )

@when('I request productivity data for "{country_code}"')
def step_request_country_data(context, country_code):
    context.response = requests.get(
        f'http://localhost:8000/productivity/{country_code}',
        headers={'Authorization': f'Bearer {context.token}'}
    )

@when('I request data for an invalid country code "{code}"')
def step_request_invalid_country(context, code):
    context.response = requests.get(
        f'http://localhost:8000/productivity/{code}',
        headers={'Authorization': f'Bearer {context.token}'}
    )

@then('I should receive a valid JSON response')
def step_receive_json(context):
    assert context.response.status_code == 200
    assert context.response.headers.get('content-type') == 'application/json'

@then('the response should contain country codes and names')
def step_response_has_countries(context):
    data = context.response.json()
    assert isinstance(data, list)
    assert len(data) > 0
    # Check first item has expected structure
    if data:
        assert 'country_code' in data[0] or 'code' in data[0]

@then('I should receive Germany\'s productivity data')
def step_receive_germany_data(context):
    assert context.response.status_code == 200
    data = context.response.json()
    assert isinstance(data, list)
    assert len(data) > 0

@then('the data should include multiple industries')
def step_data_has_industries(context):
    data = context.response.json()
    industries = set(item.get('industry', '') for item in data)
    assert len(industries) > 1

@then('each record should have year and productivity values')
def step_records_have_values(context):
    data = context.response.json()
    for record in data:
        assert 'year' in record
        assert 'productivity_index' in record or 'value' in record

@then('I should receive a 404 error')
def step_receive_404(context):
    assert context.response.status_code == 404

@then('the response should contain an appropriate error message')
def step_response_has_error(context):
    data = context.response.json()
    assert 'error' in data or 'message' in data or 'detail' in data