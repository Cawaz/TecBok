# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = create(:user, id: 1)
    post = create(:post, id: 1)
  end

  it "bodyがあれば有効であること" do
    comment = Comment.new(body: "いいレビューですね", post_id: 1, user_id: 1)
    comment.valid?
    expect(comment).to be_valid
  end

  it "bodyがなければ無効であること" do
    comment = Comment.new(body: nil, post: post, user: user)
    comment.valid?
    expect(comment.errors[:body]).to include("を入力してください")
  end
end
