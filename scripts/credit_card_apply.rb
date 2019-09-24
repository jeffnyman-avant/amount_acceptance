#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__)

require_relative "../framework"

# ========================================================================

Testable.start_browser :firefox

on_visit(Home).start_credit_card_application

on(ApplyForCreditCard).add_personal_data("credit_card_personal")
# on(ApplyForCreditCard).add_financial_data("credit_card_financial")

Testable.quit_browser
