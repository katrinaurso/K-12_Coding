class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.references :school, index: true
      t.references :admin, index: true
      t.text :content

      t.timestamps
    end
  end
end
