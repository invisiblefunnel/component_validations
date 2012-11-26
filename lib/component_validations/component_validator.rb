module ComponentValidations
  class ComponentValidator < ActiveModel::Validator
    def validate(record)
      instance = mapped_instance(record)
      instance.valid?
      copy_errors(instance, record)
    end

    private

      def mapped_instance(record)
        new_instance = options[:model_class].new
        mapping      = options[:mapping]

        mapping.inject(new_instance) do |result, (k, v)|
          result.public_send "#{k}=", record.public_send(v)
          result
        end
      end

      def copy_errors(from, to)
        from.errors.each do |name, messages|
          Array(messages).each { |msg| to.errors.add(options[:mapping][name], msg) }
        end
      end
  end
end
