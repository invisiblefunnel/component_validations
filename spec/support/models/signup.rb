require File.expand_path("../user", __FILE__)

class Signup
  include ActiveModel::Validations

  # Account validations
  validates_presence_of :account_name, :account_subdomain
  validates_format_of :account_subdomain, :with => /\A[a-z\d]+(-[a-z\d]+)*\z/i

  # User validations
  validates_presence_of :user_name, :user_email
  validates_format_of :user_email, :with => /\A[^@]+@[^@]+\z/

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
