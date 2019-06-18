# == Schema Information
#
# Table name: post_category_relations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  post_id     :integer
#

class PostCategoryRelation < ApplicationRecord
  belongs_to :category
  belongs_to :post
end
