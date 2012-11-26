class User
  include ActiveModel::Validations

  attr_accessor :name, :email

  validates_presence_of :name, :email
  validates_format_of :email, :with => /\A[^@]+@[^@]+\z/
end
