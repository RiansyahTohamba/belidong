require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
    # Add more validations as needed (e.g., password)
  end

  describe "email uniqueness" do
    it { should validate_uniqueness_of(:email) }
    # You might need to create a user first for this test
  end

  describe "Devise modules" do
    it { should have_module(:database_authenticatable) }
    # Add other Devise modules you're using (e.g., confirmable)
  end
end
