require "spec_helper"

describe ComponentValidations do
  before do
    @params = {
      :account_name => "Foo Company",
      :account_subdomain => "foo-company",
      :user_name => "Jim Dandy",
      :user_email => "jim@example.com"
    }
  end

  it "is valid given valid attributes" do
    signup = Signup.new(@params)
    expect(signup).to be_valid
  end
end
