class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :number
      t.belongs_to :team

      t.timestamps
    end
    add_index :players, :team_id
  end
end
