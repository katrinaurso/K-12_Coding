class AddAttachmentImageToNewsfeeds < ActiveRecord::Migration
  def self.up
    change_table :newsfeeds do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :newsfeeds, :image
  end
end
