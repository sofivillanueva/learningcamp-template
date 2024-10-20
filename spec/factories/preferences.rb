# == Schema Information
#
# Table name: preferences
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  restriction :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_preferences_on_user_id  (user_id)
#
FactoryBot.define do
  factory :preference do
    name { "MyString" }
    description { "MyText" }
    restriction { false }
  end
end
