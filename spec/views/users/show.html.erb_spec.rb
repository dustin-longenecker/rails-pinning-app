require 'rails_helper'
require 'spec_helper'
require 'rspec/rails'
require 'factory_bot_rails'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = FactoryBot.create(:user)
  end
 
  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@user.first_name)
    expect(rendered).to match(@user.last_name)
    expect(rendered).to match(@user.email)
  end
end