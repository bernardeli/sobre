class AddFieldsToInformation < ActiveRecord::Migration
  def change
    add_column :information, :address, :string
    add_column :information, :email, :string
    add_column :information, :phone, :string
  end
end
