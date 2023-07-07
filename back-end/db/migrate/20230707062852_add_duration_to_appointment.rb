class AddDurationToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :duration, :string
  end
end
