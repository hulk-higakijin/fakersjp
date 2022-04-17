require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    it '正常なレスポンス' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
