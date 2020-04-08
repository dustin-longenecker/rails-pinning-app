require "rails_helper"
require "spec_helper"

RSpec.describe "Our Application Routes" do
  before(:each) do
  end

  describe "GET /pins/name-:slug" do
    it 'renders the pins/show template' do
      @pin = Pin.first
      #puts @pin.nil?
      #puts @pin.inspect
      post "/pins/#{@pin.slug}", params: {pin: Pin.first}
      expect(response).to render_template("pins/show")
    end
    it 'populates the @pin variable with the appropriate pin' do
      pin = Pin.first
      get "/pins/#{pin.slug}"
      expect(assigns[:pin]).to eq(pin)
    end

  end
end
