#!/usr/bin/env ruby

$LOAD_PATH.unshift File.dirname(__FILE__)

require_relative "../framework"

# ========================================================================

Testable.start_browser :firefox

on_visit(Home).start_personal_loan_application

on(ApplyForPersonalLoan).add_personal_data("wisconsin with spouse")

Testable.quit_browser
