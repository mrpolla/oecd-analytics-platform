echo "Setting up comprehensive test environment..."

echo "Creating Docker network..."
docker network create oecd-network || echo "Network already exists"

# Create test directory structure
mkdir -p tests/{unit,integration,etl,llm,ui/selenium,ui/cypress/e2e,ui/cypress/support,bdd/features,bdd/steps,reports}

# Install Python test dependencies
cd tests
python3 -m venv test_env
source test_env/bin/activate

# Create requirements.txt for tests
cat > requirements.txt << 'EOF'
pytest==7.4.0
pytest-html==3.2.0
pytest-asyncio==0.21.1
httpx==0.24.1
selenium==4.11.2
behave==1.2.6
psycopg2-binary==2.9.7
redis==4.6.0
minio==7.1.15
requests==2.31.0
pandas==2.0.3
numpy==1.24.3
python-jose[cryptography]==3.3.0
passlib[bcrypt]==1.7.4
webdriver-manager==3.8.6
EOF

pip install -r requirements.txt

# Install Node.js dependencies for UI tests
cd ui
cat > package.json << 'EOF'
{
  "name": "oecd-ui-tests",
  "version": "1.0.0",
  "scripts": {
    "cypress:open": "cypress open",
    "cypress:run": "cypress run"
  },
  "devDependencies": {
    "cypress": "^12.17.0",
    "cypress-multi-reporters": "^1.6.3",
    "mocha-junit-reporter": "^2.2.1"
  }
}
EOF

npm install

# Set up Cypress configuration
cat > cypress.config.js << 'EOF'
const { defineConfig } = require('cypress')

module.exports = defineConfig({
  e2e: {
    baseUrl: 'http://localhost',
    supportFile: 'cypress/support/e2e.js',
    specPattern: 'cypress/e2e/**/*.cy.js',
    video: true,
    screenshotOnRunFailure: true,
    reporter: 'cypress-multi-reporters',
    reporterOptions: {
      reporterEnabled: 'spec,mocha-junit-reporter',
      mochaJunitReporterReporterOptions: {
        mochaFile: 'cypress-test-results.xml'
      }
    }
  }
})
EOF

# Initialize behave configuration
cd ../bdd
cat > behave.ini << 'EOF'
[behave]
format = json
outdir = reports
junit = true
junit_directory = reports
EOF

# Set up pre-commit hooks in root directory
cd ../../
cat > .pre-commit-config.yaml << 'EOF'
repos:
  - repo: https://github.com/psf/black
    rev: 23.3.0
    hooks:
      - id: black
        language_version: python3
  - repo: https://github.com/pycqa/flake8
    rev: 6.0.0
    hooks:
      - id: flake8
  - repo: local
    hooks:
      - id: pytest
        name: pytest
        entry: pytest
        language: python
        files: ^tests/
        additional_dependencies: [pytest]
EOF

echo "✅ Test environment setup complete!"
echo "📁 Test structure created in tests/ directory"
echo "🐍 Python virtual environment created in tests/test_env"
echo "📦 Node.js dependencies installed in tests/ui"
echo "🔧 Configuration files created"