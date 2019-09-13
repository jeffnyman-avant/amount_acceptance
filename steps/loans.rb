Given("a personal loan being applied for in Wisconsin") do
  on_visit(Home).start_personal_loan_application
  on(ApplyForPersonalLoan).add_personal_data("wisconsin with spouse")
end
