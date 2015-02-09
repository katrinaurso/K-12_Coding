class AddLogoToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :logo, :string
  end
end
