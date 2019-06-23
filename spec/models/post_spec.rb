require 'rails_helper'

RSpec.describe Post, type: :model do
  # before do
  # end

  it "title,review,rate,user_idがあれば有効であること" do
    user = FactoryBot.create(:user)
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", rate: 10)
    expect(post).to be_valid
  end

  it "titleがなければ無効であること" do
    user = FactoryBot.create(:user)
    post = Post.new(review: "絶対に読むべき", rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:title]).to include("を入力してください")
  end

  it "reviewがなければ無効であること" do
    user = FactoryBot.create(:user)
    post = Post.new(title: "人を動かす", rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:review]).to include("を入力してください")
  end

  it "rateがなければ無効であること" do
    user = FactoryBot.create(:user)
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", user_id: 1)
    post.valid?
    expect(post.errors[:rate]).to include("can't be blank")
  end

end
