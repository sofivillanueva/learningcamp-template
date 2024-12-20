# frozen_string_literal: true

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
require 'rails_helper'

RSpec.describe Preference do
  pending "add some examples to (or delete) #{__FILE__}"
end
