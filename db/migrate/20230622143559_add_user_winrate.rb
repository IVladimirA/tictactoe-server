class AddUserWinrate < ActiveRecord::Migration[7.0]
  change_table(:users, bulk: true) do |t|
    add_column :users, :wins, :integer, default: 0
    add_column :users, :loses, :integer, default: 0
  end
end
