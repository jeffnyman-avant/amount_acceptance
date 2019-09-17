class PersonalLoanBankAccount
  include Testable

  text_field :routing_number,         name:   "bank_account_routing_number"
  text_field :account_number,         name:   "bank_account_account_number"
  text_field :account_number_confirm, name:   "bank_account_account_number_confirmation"
  button     :continue,               qa_tag: "submit-button"
end

=begin
Checking

routing: 147236216
account: 2377850063111
=end
