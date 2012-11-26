require File.expand_path('../../lib/component_validations', __FILE__)

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
