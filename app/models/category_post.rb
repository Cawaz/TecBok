# == Schema Information
#
# Table name: category_posts
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  post_id     :integer
#

class CategoryPost < ApplicationRecord
end
