class Signup
  include ActiveModel::Validations

  # Account validations
  validates_with ComponentValidations::ComponentValidator, :model_class => Account, :mapping => {
    :name => :account_name,
    :subdomain => :account_subdomain
  }

  # User validations
  validates_with ComponentValidations::ComponentValidator, :model_class => User, :mapping => {
    :name => :user_name,
    :email => :user_email
  }

  # Account attributes
  attr_accessor :account_name, :account_subdomain

  # User attributes
  attr_accessor :user_name, :user_email

  def initialize(params={})
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end
end
