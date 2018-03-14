class CreateCages < ActiveRecord::Migration[5.1]
  def change
    create_table :cages do |t|
      t.references :desk, foreign_key: true
      t.string :board_id, null: false
      t.string :img_name, null: false
      t.string :img_id, null: false

      t.timestamps
    end
    add_index(:cages, [:desk_id, :board_id], unique: true)
  end
end
