# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  username               :string(255)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it "username, email, passworがあれば有効であること" do
    user = User.new(username: "Alice", email: "alice@example.com", password: "password")
    user.valid?
    expect(user).to be_valid
  end

  it "usernameがなければ無効であること" do
    user = User.new(username: nil, email: "alice@example.com", password: "password")
    user.valid?
    expect(user.errors[:username]).to include("を入力してください")
  end

  it "重複したusernameなら無効であること" do
    User.create(username: "Alice", email: "alice@example.com", password: "password")
    user = User.new(username: "Alice", email: "bob@example.com", password: "password")
    user.valid?
    expect(user.errors[:username]).to include("はすでに存在します")
  end

end
