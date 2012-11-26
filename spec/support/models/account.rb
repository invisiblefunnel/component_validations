class Account
  include ActiveModel::Validations

  attr_accessor :name, :subdomain

  validates_presence_of :name, :subdomain
  validates_format_of :subdomain, :with => /\A[a-z\d]+(-[a-z\d]+)*\z/i

  def initialize(params={})
    params.each do |attr, value|
      self.public_send("#{attr}=", value)
    end if params
  end
end
