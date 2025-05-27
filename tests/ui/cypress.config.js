const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    baseUrl: "http://localhost",
    supportFile: "cypress/support/e2e.js",
    specPattern: "cypress/e2e/**/*.cy.js",
    video: true,
    screenshotOnRunFailure: true,
    reporter: "cypress-multi-reporters",
    reporterOptions: {
      reporterEnabled: "spec,mocha-junit-reporter",
      mochaJunitReporterReporterOptions: {
        mochaFile: "cypress-test-results.xml",
      },
    },
  },
});
