require File.expand_path('../../lib/component_validations', __FILE__)

# Require support model files
["account", "user", "signup"].each do |name|
  require File.expand_path("../support/models/#{name}", __FILE__)
end

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
