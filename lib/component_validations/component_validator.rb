module ComponentValidations
  class ComponentValidator < ActiveModel::Validator
    def validate(record)
      instance = options[:model_class].new(mapped_attributes(record))
      instance.valid?
      copy_errors(instance, record)
    end

    private

      def mapped_attributes(record)
        options[:mapping].inject({}) { |result, (k, v)|
          result[k] = record.public_send(v)
          result
        }
      end

      def copy_errors(from, to)
        from.errors.each do |name, messages|
          Array(messages).each { |msg| to.errors.add(options[:mapping][name], msg) }
        end
      end
  end
end
