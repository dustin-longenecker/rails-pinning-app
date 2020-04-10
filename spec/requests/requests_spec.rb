require "rails_helper"
require "spec_helper"

RSpec.describe "Our Application Routes" do
  before(:each) do
  end

  describe "GET /pins/name-:slug" do
    it 'renders the pins/show template' do
      #@pin = Pin.first
      @pin = FactoryBot.create(:pin)

      #puts @pin.nil?
      #puts @pin.inspect
      get "/pins/name-#{@pin.slug}", params: {pin: @pin}
      expect(response).to render_template("pins/show")
      @pin.destroy
    end
    it 'populates the @pin variable with the appropriate pin' do
      #pin = Pin.first
      @pin = FactoryBot.create(:pin)
      
      get "/pins/name-#{@pin.slug}"
      expect(assigns[:pin]).to eq(@pin)
      @pin.destroy
    end

  end
end
