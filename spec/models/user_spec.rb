require 'rails_helper'

RSpec.describe User, type: :model do
  it "重複したメールアドレスなら無効であること" do
    User.create(username: "Alice", email: "alice@example.com", password: "password")
    user = User.new(username: "Bob", email: "alice@example.com", password: "password")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
