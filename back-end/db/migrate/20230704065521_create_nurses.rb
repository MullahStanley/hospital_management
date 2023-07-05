class CreateNurses < ActiveRecord::Migration[7.0]
  def change
    create_table :nurses do |t|
      t.integer :id, null:false, foreign_key: true
      t.string :name
      t.string :gender
      t.string :department

      t.timestamps
    end
  end
end
