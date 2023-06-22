# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer :first_player_id, null: false
      t.integer :second_player_id, null: false
      t.text :state, array: true, default: []
      t.string :turn, default: 'first'
      t.boolean :over, default: false

      t.timestamps
    end
  end
end
