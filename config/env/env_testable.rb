require "testable"
include Testable::Context

if defined? Cucumber
  World(Testable::Context)
end

require "data_builder"

def browser_context_start
  target = (ENV['BROWSER'] || 'firefox').to_sym
  if target == :headless
    Testable.start_browser :firefox, headless: true
  else
    Testable.start_browser target
  end
end

def browser_context_stop
  Testable.quit_browser
end
