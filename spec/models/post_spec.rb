# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  link       :text(65535)
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

  it "titleが30字なら有効であること" do
    post = Post.new(title: "a" * 30, review: "絶対に読むべき", rate: 10, user_id: 1)
    post.valid?
    expect(post).to be_valid
  end

  it "titleが31字なら無効であること" do
    post = Post.new(title: "a" * 31, review: "絶対に読むべき", rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:title]).to include("は30文字以内で入力してください")
  end

  it "reviewがなければ無効であること" do
    post = Post.new(title: "人を動かす", review: nil, rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:review]).to include("を入力してください")
  end

  it "reviewが1000字なら有効であること" do
    post = Post.new(title: "人を動かす", review: "a" * 1000, rate: 10, user_id: 1)
    post.valid?
    expect(post).to be_valid
  end

  it "reviewが1001字なら無効であること" do
    post = Post.new(title: "人を動かす", review: "a" * 1001, rate: 10, user_id: 1)
    post.valid?
    expect(post.errors[:review]).to include("は1000文字以内で入力してください")
  end

  it "rateがなければ無効であること" do
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", rate: nil, user_id: 1)
    post.valid?
    expect(post.errors[:rate]).to include("を入力してください")
  end

  it "rateが数値でなければ無効であること" do
    post = Post.new(title: "人を動かす", review: "絶対に読むべき", rate: "文字", user_id: 1)
    post.valid?
    expect(post.errors[:rate]).to include("は数値で入力してください")
  end

end
