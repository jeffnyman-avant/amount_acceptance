class ApplyForCreditCard
  include Testable
  include DataBuilder

  DataBuilder.data_path = "#{File.dirname(__FILE__)}/../data/loan"

  page_ready { [first_name.wait_until(&:present?), "First name is not present"] }
  page_ready { [last_name.wait_until(&:present?), "Last name is not present"] }
  page_ready { [continue.wait_until(&:present?), "Agree to Terms is not present"] }

  def begin_with
    DataBuilder.load("personal.yml")
  end

  # General

  div :headline, class: "headline"

  # First Step

  text_field :first_name,        id:     "person_first_name"
  text_field :last_name,         id:     "person_last_name"
  select     :birth_month,       id:     "person_date_of_birth_month"
  select     :birth_day,         id:     "person_date_of_birth_day"
  select     :birth_year,        id:     "person_date_of_birth_year"
  text_field :ssn,               id:     "person_ssn"
  text_field :home_phone,        id:     "person_home_phone"
  text_field :email,             id:     "customer_email"
  text_field :password,          name:   "customer_password"
  text_field :confirm_password,  name:   "customer_password_confirmation"

  checkbox   :consent,           name:   "customer_electronic_communications_consent"
  button     :continue,          qa_tag: "agree-terms"

  # Second Step

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

  def add_personal_data(person)
    expect(headline.text).to eql "Please tell us a little about yourself."

    when_ready do
      use(data_about(person))
    end

    consent.check
    continue.click
  end

  def add_financial_data(person)
    expect(headline.text).to eql "Please tell us a little about your financial situation."

    when_ready do
      use(data_about(person))
    end

    authorize.check
    # complete.click
  end
end
