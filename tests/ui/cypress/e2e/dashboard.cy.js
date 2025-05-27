describe("OECD Dashboard E2E Tests", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should display login page", () => {
    cy.get("#username").should("be.visible");
    cy.get("#password").should("be.visible");
    cy.get('button[type="submit"]').should("be.visible");
    cy.title().should("contain", "OECD Analytics");
  });

  it("should login successfully with valid credentials", () => {
    cy.get("#username").type("bundesdruckerei");
    cy.get("#password").type("demo123");
    cy.get('button[type="submit"]').click();

    cy.get(".dashboard").should("be.visible");
    cy.contains("Productivity Analysis").should("be.visible");
  });

  it("should show error with invalid credentials", () => {
    cy.get("#username").type("invalid_user");
    cy.get("#password").type("invalid_pass");
    cy.get('button[type="submit"]').click();

    cy.get(".error").should("be.visible");
    cy.contains("Invalid credentials").should("be.visible");
  });

  it("should load and display charts", () => {
    // Login first
    cy.get("#username").type("bundesdruckerei");
    cy.get("#password").type("demo123");
    cy.get('button[type="submit"]').click();

    cy.get(".dashboard").should("be.visible");
    cy.get(".recharts-wrapper").should("have.length.greaterThan", 0);
  });

  it("should allow country selection and comparison", () => {
    // Login
    cy.get("#username").type("bundesdruckerei");
    cy.get("#password").type("demo123");
    cy.get('button[type="submit"]').click();

    cy.get(".dashboard").should("be.visible");

    // Select country
    cy.get("select").select("DEU");
    cy.contains("Germany").should("be.visible");

    // Verify chart updates
    cy.get(".recharts-wrapper").should("be.visible");
  });

  it("should handle API errors gracefully", () => {
    // Mock API failure
    cy.intercept("GET", "/api/countries", { forceNetworkError: true }).as(
      "getCountriesError"
    );

    // Login
    cy.get("#username").type("bundesdruckerei");
    cy.get("#password").type("demo123");
    cy.get('button[type="submit"]').click();

    cy.wait("@getCountriesError");
    cy.contains("Error loading data").should("be.visible");
  });
});
