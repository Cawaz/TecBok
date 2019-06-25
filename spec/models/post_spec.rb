# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  rate       :integer          not null
#  review     :text(65535)      not null
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    user = create(:user, id: 1)
  end

  it "title,review,rate,user_idがあれば有効であること" do
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", rate: 10, user_id: 1)
    post.valid?
    expect(post).to be_valid
  end

  it "titleがなければ無効であること" do
    post = Post.new(title: nil, review: "絶対に読むべき", rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "reviewがなければ無効であること" do
    post = Post.new(title: "人を動かす", review: nil, rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:review]).to include("を入力してください")
  end

  it "rateがなければ無効であること" do
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", rate: nil, user_id: 1)
    post.valid?
    expect(post.errors[:rate]).to include("を入力してください")
  end

end
