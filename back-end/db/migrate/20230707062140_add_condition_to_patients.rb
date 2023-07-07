class AddConditionToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :condition, :string
  end
end
