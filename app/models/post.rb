# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  rate        :integer          not null
#  review      :text(65535)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes, dependent: :destroy
  belongs_to :user
end
