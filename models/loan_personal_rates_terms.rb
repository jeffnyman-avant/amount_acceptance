class PersonalLoanRatesTerms
  include Testable

  page_ready { [select_and_continue.wait_until(&:present?), "Submit data button is not present."] }
  page_ready { [loan_slider.wait_until(&:present?), "Loan slider is not present."] }

  # Autofill Data

  button :autofill_personal_1,  id: "ref-autofill-personal",            text: "Autofill Personal"
  button :autofill_personal_2,  id: "ref-autofill-personal-continued",  text: "Autofill Personal Continued"
  button :autofill_contract,    id: "ref-autofill-contract",            text: "Autofill Contract"
  button :autofill_bank,        id: "ref-autofill-bank",                text: "Autofill Bank"
  button :autofill_income,      id: "ref-autofill-income",              text: "Autofill Income"

  # Application Data

  button :select_and_continue,  qa_tag: "submit"
  div    :loan_slider,          qa_tag: "loan-slider"

  def accept_default
    when_ready do
      select_and_continue.click
    end
  end
end
