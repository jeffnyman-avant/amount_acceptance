#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__)

require_relative "../framework"

# ========================================================================

Testable.start_browser :firefox

on_visit(Home).start_credit_card_application

on(ApplyForCreditCardPersonal).verify_validation_messages
on(ApplyForCreditCardPersonal).add_personal_data("credit_card_personal")

on(ApplyForCreditCardFinancial).verify_validation_messages
#on(ApplyForCreditCardFinancial).add_financial_data("credit_card_financial")

Testable.quit_browser
