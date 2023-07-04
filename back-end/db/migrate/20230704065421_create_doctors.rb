class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.integer :id, null:false, foreign_key: true
      t.string :gender
      t.string :name
      t.text :speciality

      t.timestamps
    end
  end
end
