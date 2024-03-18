require 'rails_helper'

RSpec.describe Article, type: :model do
  context "Creating a user" do
    let(:article) {build :article}

    it "Should be a valid article" do
      expect(article.valid?).to eq(true)
    end
    
  end
  
end
