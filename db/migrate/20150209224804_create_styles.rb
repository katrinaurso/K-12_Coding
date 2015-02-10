class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.references :school, index: true
      t.text :current
      t.text :previous

      t.timestamps
    end
  end
end
