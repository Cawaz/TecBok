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

FactoryBot.define do
  factory :post do
    title "Webを支える技術"
    review "Webサービスの実践的な設計を学ぶことができます。"
    rate 5
    user_id 1
  end
end
