require 'rails_helper'

RSpec.describe "home/index", type: :view do
  
  describe 'ルートページ' do
    before do
      visit root_path
    end

    it '見出しが表示' do
      expect(page).to have_content 'Come on, fakers'
    end

    it 'Sign upボタンが表示' do
      expect(page).to have_content 'Sign up'
    end

    it 'Log inボタンが表示' do
      expect(page).to have_content 'Log in'
    end

    it 'Loginページに遷移' do
      click_on 'Log in'
      expect(page).to have_content 'fackersにログイン'
    end

    it 'Sign upページに遷移' do
      click_on 'Sign up'
      expect(page).to have_content 'アカウントを作成'
    end
  end
end
