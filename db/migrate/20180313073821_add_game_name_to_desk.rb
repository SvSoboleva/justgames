class AddGameNameToDesk < ActiveRecord::Migration[5.1]
  def change
    add_column :desks, :game_name, :string,  null: false
  end
end
