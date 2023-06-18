# frozen_string_literal: true

class ChangeUserRestrictions < ActiveRecord::Migration[7.0]
  def change
    change_table(:users, bulk: true) do |t|
      t.column(:username, :string, null: true)
      t.column(:email, :string, null: true)
      t.column(:passHash, :string, null: true)
    end
  end
end
