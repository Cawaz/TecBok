require 'rails_helper'

RSpec.feature "ログインとログアウト", type: :feature do
  background do
    create(:user)

    visit root_path
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  scenario 'ログインする' do
    expect(page).to have_content 'ログインしました。'
  end

  scenario 'ログアウトする' do
    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました。'
  end
end
