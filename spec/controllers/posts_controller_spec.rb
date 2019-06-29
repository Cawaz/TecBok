require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }

  before do
    login_user user
  end

  describe 'GET #new' do
    before { get :new }

    it 'レスポンスコードが200であること' do
      expect(response).to be_successful
    end

    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end

    it '新しいpostオブジェクトがビューに渡されること' do
      expect(assigns(:post)).to be_a_new Post
    end
  end

  describe 'POST #create' do
    context '正しい投稿情報が渡って来た場合' do
      let(:params) do
        {post: {
            title: '人を動かす',
            review: '絶対に読むべき',
            rate: 10,
            user_id: 1
          }
        }
      end

      it '投稿が一つ増えていること' do
        expect { post :create, params: params }.to change(Post, :count).by(1)
      end

      it '投稿一覧ページにリダイレクトされていること' do
        expect(post :create, params: params).to redirect_to(root_path)
      end
    end

  end
end
