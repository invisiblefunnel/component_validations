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

  it "requires an account name" do
    signup = Signup.new(@params.merge(:account_name => ""))
    expect(signup).to_not be_valid
    expect(signup.errors[:account_name]).to eq ["can't be blank"]
  end

  it "requires an account subdomain" do
    signup = Signup.new(@params.merge(:account_subdomain => ""))
    expect(signup).to_not be_valid
    expect(signup.errors[:account_subdomain]).to eq ["can't be blank", "is invalid"]
  end

  it "validates the format of the account subdomain" do
    signup = Signup.new(@params.merge(:account_subdomain => "foo company"))
    expect(signup).to_not be_valid
    expect(signup.errors[:account_subdomain]).to eq ["is invalid"]
  end

  it "requires a user name" do
    signup = Signup.new(@params.merge(:user_name => ""))
    expect(signup).to_not be_valid
    expect(signup.errors[:user_name]).to eq ["can't be blank"]
  end

  it "requires a user email" do
    signup = Signup.new(@params.merge(:user_email => ""))
    expect(signup).to_not be_valid
    expect(signup.errors[:user_email]).to eq ["can't be blank", "is invalid"]
  end

  it "validates the format of the user email" do
    signup = Signup.new(@params.merge(:user_email => "jimexample.com"))
    expect(signup).to_not be_valid
    expect(signup.errors[:user_email]).to eq ["is invalid"]
  end
end
