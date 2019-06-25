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

FactoryBot.define do
  factory :comment do

  end
end