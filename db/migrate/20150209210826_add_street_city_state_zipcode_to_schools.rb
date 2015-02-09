class AddStreetCityStateZipcodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :street, :string
    add_column :schools, :city, :string
    add_column :schools, :state, :string
    add_column :schools, :zipcode, :integer
  end
end
