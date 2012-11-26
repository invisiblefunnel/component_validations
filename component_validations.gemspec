# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'component_validations/version'

Gem::Specification.new do |s|
  s.name          = "component_validations"
  s.version       = ComponentValidations::VERSION
  s.authors       = ["Daniel Whalen"]
  s.email         = ["daniel.r.whalen@gmail.com"]
  s.summary       = %q{Validations for ActiveModel objects composed of other ActiveModel objects}
  s.description   = <<-DESCRIPTION
A useful pattern for building multi-model forms in Rails is to use a form 
object which composes other model objects. One barrier to this strategy 
is validating the form object without duplicating the validation logic 
already described by component models. component_validations is an attempt 
to remove this barrier by mapping form object attributes to their component 
models and delegating all validations without using validates_associated and 
accepts_nested_attributes.
  DESCRIPTION
  s.homepage      = "https://github.com/invisiblefunnel/component_validations"
  s.files         = Dir["lib/**/*"] + ["LICENSE.md", "Rakefile", "README.md"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.12.0"
end
