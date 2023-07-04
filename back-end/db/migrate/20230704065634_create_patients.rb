class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :name
      t.integer :age
      t.string :gender
      t.text :medical_history

      t.timestamps
    end
  end
end
