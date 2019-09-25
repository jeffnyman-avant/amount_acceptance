require "testable"
require "data_builder"
require "data_accessible"

include RSpec::Matchers

Dir["#{File.dirname(__FILE__)}/../config/config.rb"].each {|f| require f}
Dir["#{File.dirname(__FILE__)}/../models/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  include Testable::Context

  config.formatter = "documentation"
  config.color = true
  config.before(:example) { Testable.set_browser :firefox }
  config.after(:example)  { Testable.quit_browser }
end
