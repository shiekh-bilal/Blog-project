require 'rails_helper'

RSpec.describe User, type: :model do
  # context "Creating a user" do
  #   let(:user) {build :user}

  #   it "Should be a valid user" do
  #     expect(user.valid?).to eq(true)
  #   end
    
  # end
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end
end
