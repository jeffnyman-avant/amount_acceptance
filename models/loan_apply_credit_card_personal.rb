class ApplyForCreditCardPersonal
  include Testable
  include DataBuilder

  DataBuilder.data_path = "#{File.dirname(__FILE__)}/../data/loan"

  page_ready { [first_name.wait_until(&:present?), "First name is not present"] }
  page_ready { [last_name.wait_until(&:present?), "Last name is not present"] }
  page_ready { [continue.wait_until(&:present?), "Agree to Terms is not present"] }

  def begin_with
    data = DataBuilder.load("personal.yml")
  end

  div        :headline,          class:  "headline"

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

  def add_personal_data(person)
    when_ready do
      expect(headline.text).to eql "Please tell us a little about yourself."

      use(data_about(person))
    end

    consent.check
    continue.click
  end
end
