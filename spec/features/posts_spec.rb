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

  scenario '投稿一覧画面' do
    expect(page).to have_content '投稿がありません'
  end

  scenario '投稿して更新する' do
    click_link '新規投稿'
    fill_in 'タイトル', with: 'テスト投稿'
    fill_in 'レビュー', with: 'レビューです。'
    click_button '投稿する'
    expect(page).to have_content '登録しました。'

    click_link 'テスト投稿'
    expect(current_path).to eq post_path(Post.last)

    click_link '編集'
    expect(current_path).to eq edit_post_path(Post.last)

    fill_in 'タイトル', with: 'テスト投稿2'
    click_button '更新する'

    expect(page).to have_content '更新しました。'
    expect(page).to have_content 'テスト投稿2'
  end
end
