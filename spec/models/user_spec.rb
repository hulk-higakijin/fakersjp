require 'rails_helper'

RSpec.describe User, type: :model do

  before do 
    @user = create(:user)
  end

  describe 'ユーザー登録' do
    it '正常' do
      expect(@user.valid?).to eq(true)
    end

    it '名前がないと失敗' do
      user = User.create(email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user.valid?).to eq(false)
    end

    it 'emailがないと失敗' do
      user = User.create(name: 'hogehoge', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user.valid?).to eq(false)
    end

    it 'パスワードが異なると失敗' do
      user = User.create(name: 'hogehoge', email: 'foobar@example.com', password: 'hogehoge', password_confirmation: 'foobar')
      expect(user.valid?).to eq(false)
    end

    it 'emailは重複しない' do
      user_a = User.create(name: 'aaaaaa', email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      user_b = User.create(name: 'bbbbbb', email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_b.valid?).to eq(false)
    end

    it 'nameは15字だと成功' do
      name = 'a' * 15
      user_fifteen = User.create(name: name, email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_fifteen.valid?).to eq(true)
    end

    it 'nameは16字より多いと失敗' do
      name = 'a' * 16
      user_sixteen = User.create(name: name, email: 'foobar@example.com', password: 'hogehogefoobar', password_confirmation: 'hogehogefoobar')
      expect(user_sixteen.valid?).to eq(false)
    end
  end

  describe 'public_uidに関連するテスト' do
    it '存在する' do
      expect(@user.public_uid.present?).to eq(true)
    end

    it '20文字以下' do
      uid = "a" * 21
      expect(@user.update(public_uid: uid )).to eq(false)
    end

    it '空文字にできない' do
      expect(@user.update(public_uid: "")).to eq(false)
    end

    it 'ひらがなは使えない' do
      expect(@user.update(public_uid: "ああああああああ")).to eq(false)
    end

    it 'カタカナは使えない' do
      expect(@user.update(public_uid: "イイイイ")).to eq(false)
    end

    it '漢字は使えない' do
      expect(@user.update(public_uid: "阿鼻叫喚")).to eq(false)
    end

    it '重複しない' do
      uid = @user.public_uid
      user_a = User.create(name: 'aaa', email: 'aaa@example.com', password: 'aaaaaa', password_confirmation: 'aaaaaa')
      expect(user_a.update(public_uid: uid)).to eq(false)
    end

  end
end
