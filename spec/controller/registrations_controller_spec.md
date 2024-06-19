require 'spec_helper'

RSpec.describe RegistrationsController, type: :controller do
  before do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new user" do
        post :create, params: valid_user_attributes
        expect(response).to have_http_status(302) # Redirect on success
      end
    end

    context "with invalid attributes" do
      it "doesn't create a new user" do
        post :create, params: invalid_user_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  def valid_user_attributes
    # Use FactoryBot to create valid user attributes
    FactoryBot.attributes_for(:user)
  end

  def invalid_user_attributes
    # Create attributes with an error (e.g., missing email)
    attributes = FactoryBot.attributes_for(:user)
    attributes.delete(:email)
    attributes
  end
end
