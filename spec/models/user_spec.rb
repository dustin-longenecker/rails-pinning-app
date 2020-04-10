require 'rails_helper'

require 'spec_helper'
require 'shoulda-matchers'
require 'rspec/rails'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @user = User.create(email: "coder@skillcrush", password: "password")
  end

  after(:all) do
    if !@user.destroyed?
      @user.destroy
    end
  end

  it 'authenticates and returns a user when valid email and password passed in' do
    User.is_auth?(@user.email, @user.password)
  end
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

end
