Feature: Apply for Credit Card

  Scenario: Verify Validation Errors for Personal Information
    Given a user supplying personal information while applying for a credit card

    * submitting no personal information provides validation errors

  Scenario: Verify Validation Errors for Financial Information
    Given a user supplying financial information while applying for a credit card

    * submitting no financial information provides validation errors

  Scenario: Apply for Credit Card
