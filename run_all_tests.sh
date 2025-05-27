#!/bin/bash

set -e

echo "🧪 Running comprehensive test suite..."

# Setup
export PYTHONPATH=$PWD
cd tests

# Create reports directory
mkdir -p reports

# Create virtual environment if it doesn't exist
if [ ! -d "test_env" ]; then
    python3 -m venv test_env
fi

source test_env/bin/activate
pip install -r requirements.txt

# Run tests in order
echo "📋 Running Unit Tests..."
python -m pytest unit/ -v --junitxml=reports/unit-results.xml --html=reports/unit-report.html || true

echo "🔗 Running Integration Tests..."
python -m pytest integration/ -v --junitxml=reports/integration-results.xml --html=reports/integration-report.html || true

echo "⚙️  Running ETL Tests..."
python -m pytest etl/ -v --junitxml=reports/etl-results.xml --html=reports/etl-report.html || true

echo "🤖 Running LLM Tests..."
python -m pytest llm/ -v --junitxml=reports/llm-results.xml --html=reports/llm-report.html || true

echo "🌐 Running UI Tests..."
cd ui
# Selenium tests
python -m pytest selenium/ -v --junitxml=../reports/selenium-results.xml --html=../reports/selenium-report.html || true

# Cypress tests
npm run cypress:run || true
cd ..

echo "🥒 Running BDD Tests..."
cd bdd
behave --junit --junit-directory=../reports --format json -o ../reports/behave-results.json || true
cd ..

echo "📊 Generating Test Summary..."
python << 'EOF'
import json
import xml.etree.ElementTree as ET
import os
from pathlib import Path

def parse_junit_xml(file_path):
    if not os.path.exists(file_path):
        return {"tests": 0, "failures": 0, "errors": 0, "passed": 0}
    
    tree = ET.parse(file_path)
    root = tree.getroot()
    
    tests = int(root.get('tests', 0))
    failures = int(root.get('failures', 0))
    errors = int(root.get('errors', 0))
    passed = tests - failures - errors
    
    return {"tests": tests, "failures": failures, "errors": errors, "passed": passed}

# Parse all test results
results = {}
test_files = [
    'unit-results.xml',
    'integration-results.xml', 
    'etl-results.xml',
    'llm-results.xml',
    'selenium-results.xml'
]

total_tests = 0
total_passed = 0
total_failed = 0
total_errors = 0

for test_file in test_files:
    file_path = f'reports/{test_file}'
    result = parse_junit_xml(file_path)
    test_name = test_file.replace('-results.xml', '')
    results[test_name] = result
    
    total_tests += result['tests']
    total_passed += result['passed']
    total_failed += result['failures']
    total_errors += result['errors']

print("\n" + "="*60)
print("🧪 TEST SUMMARY")
print("="*60)
for test_type, result in results.items():
    print(f"{test_type.upper():20} | Tests: {result['tests']:3} | Passed: {result['passed']:3} | Failed: {result['failures']:3} | Errors: {result['errors']:3}")

print("-"*60)
print(f"{'TOTAL':20} | Tests: {total_tests:3} | Passed: {total_passed:3} | Failed: {total_failed:3} | Errors: {total_errors:3}")
print("="*60)

success_rate = (total_passed / total_tests * 100) if total_tests > 0 else 0
print(f"Success Rate: {success_rate:.1f}%")

if total_failed > 0 or total_errors > 0:
    print("❌ Some tests failed - check reports for details")
    exit(1)
else:
    print("✅ All tests passed!")
EOF

echo "✅ Test execution complete!"
echo "📋 Check tests/reports/ directory for detailed results"
echo "🌐 Open tests/reports/*-report.html for visual test reports"