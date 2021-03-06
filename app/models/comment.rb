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

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :body, presence: true, length: { maximum: 100 }
end
