# ComponentValidations

_This repo is an experiment and strays from the standard Rails way._

A useful strategy for building multi-model forms in Rails is to use a form object which composes other model objects. This is well described on the [Code Climate Blog](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/). One barrier to this strategy is validating the form object without duplicating the validation logic already described by component models. `component_validations` is an attempt to remove this barrier by mapping ActiveModel object attributes to their component models and delegating all validations _without_ using `validates_associated` or `accepts_nested_attributes`.

## Usage

```ruby
class Signup
  include ActiveModel::Validations

  validates_component Account, :name => :account_name, :subdomain => :account_subdomain
  validates_component User, {
    :name => :name,
    :email => :email,
    :password => :password,
    :password_confirmation => :password_confirmation
  }

  # ...
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
