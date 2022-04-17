require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  describe 'ログインのテスト' do
    before do
      visit new_user_session_path
      @user = create(:user)
    end

    it '正常' do
      fill_in 'email', with: 'hogehoge@example.com'
      fill_in 'password', with: 'hogehogefoobar'
      click_on 'ログイン'
      expect(page).to have_content('Come on')
    end

  end
end
