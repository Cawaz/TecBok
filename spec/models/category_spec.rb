# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  it "nameがあれば有効であること" do
    category = Category.new(name: "Ruby")
    category.valid?
    expect(category).to be_valid
  end

  it "重複したnameなら無効であること" do
    Category.create(name: "Ruby on Rails")
    category = Category.new(name: "Ruby on Rails")
    category.valid?
    expect(category.errors[:name]).to include("はすでに存在します")
  end
end
