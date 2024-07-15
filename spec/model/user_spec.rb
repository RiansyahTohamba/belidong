require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it 'should validate presence of several fields' 
    it "should email uniqueness" 
    # should validate_presence_of(:email) 
    # Add more validations as needed (e.g., password)
  end

  describe "Devise modules" do
    # it { should have_module(:database_authenticatable) }
    # Add other Devise modules you're using (e.g., confirmable)
  end
end
