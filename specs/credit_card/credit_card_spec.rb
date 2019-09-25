RSpec.describe "Application for Credit Card" do
  it "will apply for a credit card" do
    on_visit(Home).start_credit_card_application

    on(ApplyForCreditCardPersonal).verify_validation_messages
    on(ApplyForCreditCardPersonal).add_personal_data("credit_card_personal")

    on(ApplyForCreditCardFinancial).verify_validation_messages
    # on(ApplyForCreditCardFinancial).add_financial_data("credit_card_financial")
  end
end
