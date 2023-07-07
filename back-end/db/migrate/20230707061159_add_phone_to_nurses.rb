class AddPhoneToNurses < ActiveRecord::Migration[7.0]
  def change
    add_column :nurses, :phone, :string
  end
end
