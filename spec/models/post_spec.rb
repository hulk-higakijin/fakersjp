require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:user)
  end

  describe '投稿に関するテスト' do
    let(:content) { 'this is a beautiful world.' }
    it '正常' do
      post = @user.posts.create(content: content)
      expect(post.valid?).to eq(true)
    end

    it 'contentが必須' do
      post = @user.posts.create(content: '')
      expect(post.valid?).to eq(false)
    end

    it 'ユーザー情報が必要' do
      post = Post.create(content: content)
      expect(post.valid?).to eq(false)
    end

    it '280文字以下' do
      content_a = 'a' * 281
      post_a = @user.posts.create(content: content_a)
      content_b = 'b' * 280
      post_b = @user.posts.create(content: content_b)
      expect(post_a.invalid? && post_b.valid?).to eq(true)
    end
  end
end
