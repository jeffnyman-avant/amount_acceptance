class ApplyForCreditCardFinancial
  include Testable
  include DataBuilder

  DataBuilder.data_path = "#{File.dirname(__FILE__)}/../data/loan"

  page_ready { [employment_status.wait_until(&:present?), "Employment status is not present"] }
  page_ready { [state.wait_until(&:present?), "State is not present"] }
  page_ready { [complete.wait_until(&:present?), "Agree to Terms is not present"] }

  def begin_with
    data = DataBuilder.load("personal.yml")
  end

  div        :headline,          class:  "headline"

  select     :employment_status, id:     "income_income_type"
  text_field :monthly_income,    id:     "income_monthly_net_income"
  select     :credit_rating,     id:     "customer_application_metadata_self_credit_score"
  select     :bank_balance,      id:     "customer_application_metadata_current_bank_account_balance"
  text_field :address_1,         id:     "customer_address_address_1"
  text_field :city,              id:     "customer_address_city"
  select     :state,             id:     "customer_address_state"
  text_field :zipcode,           id:     "customer_address_zip"
  label      :rent,              text:   "Rent"
  label      :own,               text:   "Own"
  text_field :monthly_payment,   id:     "customer_address_monthly_housing_payment"

  checkbox   :authorize,         name:   "customer_credit_report_authorization"
  button     :complete,          qa_tag: "agree-terms"

  def add_financial_data(person)
    when_ready do
      expect(headline.text).to eql "Please tell us a little about your financial situation."

      use(data_about(person))
    end

    authorize.check
    complete.click
  end
end
