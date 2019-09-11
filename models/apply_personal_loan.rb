class ApplyForPersonalLoan
  include Testable
  include DataBuilder

  DataBuilder.data_path = "#{File.dirname(__FILE__)}/../data/loan"

  page_ready { [first_name.wait_until(&:present?), "First name is not present"] }
  page_ready { [last_name.wait_until(&:present?), "Last name is not present"] }

  # Autofill Data

  button :autofill_personal_1,  id: "ref-autofill-personal",            text: "Autofill Personal"
  button :autofill_personal_2,  id: "ref-autofill-personal-continued",  text: "Autofill Personal Continued"
  button :autofill_contract,    id: "ref-autofill-contract",            text: "Autofill Contract"
  button :autofill_bank,        id: "ref-autofill-bank",                text: "Autofill Bank"
  button :autofill_income,      id: "ref-autofill-income",              text: "Autofill Income"

  # Application Data

  text_field  :first_name,          id: "person_first_name"
  text_field  :last_name,           id: "person_last_name"
  text_field  :address_1,           id: "customer_address_address_1"
  text_field  :address_2,           id: "customer_address_address_2"
  text_field  :city,                id: "customer_address_city"
  select_list :state,               id: "customer_address_state"
  text_field  :zip_code,            id: "customer_address_zip"

  checkbox    :military_address,    id: "customer_address_military_address"

  label       :rent,                text: "Rent"
  label       :own,                 text: "Own"

  text_field  :monthly_payment,     id: "customer_address_monthly_housing_payment"
  select_list :address_start_month, id: "customer_application_metadata_address_start_date_month"
  select_list :address_start_year,  id: "customer_application_metadata_address_start_date_year"

  select_list :birth_month,         id: "person_date_of_birth_month"
  select_list :birth_day,           id: "person_date_of_birth_day"
  select_list :birth_year,          id: "person_date_of_birth_year"

  text_field  :phone,               id: "person_home_phone"
  text_field  :email,               id: "customer_email"
  text_field  :password,            name: "customer_password"
  text_field  :confirm_password,    name: "customer_password_confirmation"
  text_field  :ssn,                 id: "person_ssn"

  select_list :income_type,         id: "income_income_type"
  text_field  :monthly_net_income,  id: "income_monthly_net_income"

  select_list :loan_purpose,        id: "customer_application_loan_purpose"
  text_field  :loan_amount,         id: "customer_application_metadata_requested_loan_amount"
  select_list :credit_quality,      id: "customer_application_metadata_self_credit_score"

  text_field  :promotional_code,    id: "new_promotion_coupon_code"
  button      :add_promotion_code,  data_qa: "new_promotion_coupon_code_button"

  label       :facebook,            class: "headline", text: "Facebook"
  label       :radio,               class: "headline", text: "Radio"
  label       :friend_family,       class: "headline", text: "Friends & Family"
  label       :podcast,             class: "headline", text: "Podcast"
  label       :outdoor_ad,          class: "headline", text: "Outdoor Ad"
  label       :mail_offer,          class: "headline", text: "Mail Offer"
  label       :tv,                  class: "headline", text: "TV"
  label       :other,               class: "headline", text: "Other"

  checkbox    :consent,             id: "customer_electronic_communications_consent"

  button      :agree,               qa_tag: "submit", class: ["app-form__submit", "button button--primary"]

  def add_personal_data(person)
    # LoanData = DataAccessible.sources do |source|
    #   source.data_load "data/loan/personal.yml"
    # end
    # puts LoanData.data

    DataBuilder.load("personal.yml")

    when_ready do
      use(data_about(person))
    end

    consent.click
    agree.click
  end
end
