class AddUpdatedByToNewsfeeds < ActiveRecord::Migration
  def change
    add_reference :newsfeeds, :updated_by, index: true
  end
end
