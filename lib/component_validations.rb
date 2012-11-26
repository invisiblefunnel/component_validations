require "active_model"
require "component_validations/version"
require "component_validations/component_validator"

module ActiveModel
  module Validations
    module ClassMethods
      def validates_component(model_class, mapping)
        validates_with ComponentValidations::ComponentValidator, :model_class => model_class, :mapping => mapping
      end
    end
  end
end
