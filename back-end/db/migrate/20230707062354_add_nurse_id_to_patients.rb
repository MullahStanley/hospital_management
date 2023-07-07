class AddNurseIdToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :nurse_id, :string
  end
end
