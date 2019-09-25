Given("a user supplying personal information while applying for a credit card") do
  on_visit(Home).start_credit_card_application
end

Given("a user supplying financial information while applying for a credit card") do
  on_visit(Home).start_credit_card_application
  on(ApplyForCreditCardPersonal).add_personal_data("credit_card_personal")
end

Then("submitting no personal information provides validation errors") do
  on(ApplyForCreditCardPersonal).verify_validation_messages
  puts on(ApplyForCreditCardPersonal).display_validation_errors
end

Then("submitting no financial information provides validation errors") do
  on(ApplyForCreditCardFinancial).verify_validation_messages
  puts on(ApplyForCreditCardFinancial).display_validation_errors
end
