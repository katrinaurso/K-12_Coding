class AddTitleToNewsfeeds < ActiveRecord::Migration
  def change
    add_column :newsfeeds, :title, :string
  end
end
