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
  let(:category) { build(:category, name: "Ruby")}
  subject { category.valid? }

  context 'nameがあれば有効であること' do
    it { is_expected.to be true }
  end

  context '重複したnameなら無効であること' do
    let!(:category2) { create(:category, name: "Ruby")}
    it { is_expected.to be false }
  end
end
