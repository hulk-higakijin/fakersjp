require 'rails_helper'

RSpec.describe "registrations/new", type: :view do
  describe 'サインアップのテスト' do
    before do
      visit new_user_registration_path
    end

    it '正常' do
      fill_in 'name', with: 'hogehoge'
      fill_in 'email', with: 'hoge@example.com'
      fill_in 'password', with: 'hogehogefoobar'
      fill_in 'password（確認）', with: 'hogehogefoobar'
      click_on '作成'
      expect(page).to have_content('Come on') ## ログアウトした後の遷移はまだ未定
    end
  end
end
