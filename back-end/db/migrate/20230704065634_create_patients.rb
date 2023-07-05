class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :id
      t.string :name
      t.integer :age
      t.string :gender
      t.text :medical_history
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
