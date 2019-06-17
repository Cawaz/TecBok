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

require 'test_helper'

class CategoryPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
