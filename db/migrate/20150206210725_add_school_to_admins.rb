class AddSchoolToAdmins < ActiveRecord::Migration
  def change
    add_reference :admins, :school, index: true
  end
end
