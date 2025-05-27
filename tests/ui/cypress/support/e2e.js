// Custom commands
Cypress.Commands.add(
  "login",
  (username = "bundesdruckerei", password = "demo123") => {
    cy.get("#username").type(username);
    cy.get("#password").type(password);
    cy.get('button[type="submit"]').click();
  }
);
