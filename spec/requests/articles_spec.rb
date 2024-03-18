require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:article) { FactoryBot.create(:article)}

  context "Get /Index" do
    it "should render index page" do
      get articles_path
      expect(response).to render_template :index
    end
  end
end
