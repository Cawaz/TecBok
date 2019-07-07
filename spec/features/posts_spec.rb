require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  background do
    user = create(:user)

    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  it '投稿一覧画面' do
    expect(page).to have_content '投稿がありません'
  end

  it '投稿する' do
    click_link '新規投稿'
    fill_in 'タイトル', with: 'テスト投稿'
    fill_in 'レビュー', with: 'レビューです。'
    click_button '投稿する'
    expect(page).to have_content '登録しました。'
  end
end
