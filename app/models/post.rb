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
  has_one_attached :cover_image
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_category_relations, dependent: :destroy
  has_many :categories, through: :post_category_relations
  belongs_to :user

  validates :title, presence: true
  validates :review, presence: true

  scope :recent, -> { order(created_at: :desc) }

  def image
    cover_image.attached? ? cover_image : '/images/fallback/no_image.png'
  end
end
