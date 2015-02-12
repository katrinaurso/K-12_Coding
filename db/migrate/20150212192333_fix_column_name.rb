class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :admins, :password, :encrypted_password
  end
end
