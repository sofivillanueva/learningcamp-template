# frozen_string_literal: true

class AddUserIdToPreferences < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_reference :preferences, :user, null: false, index: { algorithm: :concurrently }, default: 1
  end
end
