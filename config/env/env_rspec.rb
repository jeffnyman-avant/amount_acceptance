require "rspec"
include RSpec::Matchers

if defined? Cucumber
  World(RSpec::Matchers)
end
