class ApplyForCreditCardFinancial
  include Testable
  include DataBuilder
  include DataAccessible

  DataBuilder.data_path = "#{File.dirname(__FILE__)}/../data/loan"

  page_ready { [employment_status.wait_until(&:present?), "Employment status is not present"] }
  page_ready { [state.wait_until(&:present?), "State is not present"] }
  page_ready { [complete.wait_until(&:present?), "Agree to Terms is not present"] }

  def begin_with
    DataBuilder.load("personal.yml")

    @financial = DataAccessible.sources do |source|
      source.data_load "#{File.dirname(__FILE__)}/../../data/loan/credit_card_financial_validations.yml"
    end
  end

  div        :headline,          class:  "headline"
  form       :apply_form,        name:   "form"
  smalls     :errors,            class:  ["form__error", "!ng-hide"]

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

  def verify_validation_messages
    sleep 10

    when_ready do
      complete.click
      apply_form.wait_until(&:dom_updated?)

      error_list = []

      errors.each do |error|
        error_list.push(error.text)
      end

      expect(error_list.size).to eq(9)

      @financial.invalid.financial_data.each do |item|
        expect(error_list).to include(item)
      end

      @validations_list = error_list
    end
  end

  def display_validation_errors
    @validations_list.join("\n")
  end
end
