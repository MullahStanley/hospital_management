class AddDateToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :date, :string
  end
end
