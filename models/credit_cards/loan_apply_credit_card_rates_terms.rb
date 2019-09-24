class ApplyForCreditCardRatesTerms
  include Testable

  # Note: Currently this page cannot be reached by the automation.
  # The current spec seems to stub out elements that cause a different path
  # to be followed than if you do the same steps manually. This is not
  # dependent on data as far as can be seen.

  # Unsure how to proceed at this point. I have to determine what these lines
  # in the current spec actually do:

  # stub_env('CREDIT_CARD_DECISIONING_ENABLED' => '1')
  # stub_model_score(0.005)
end
