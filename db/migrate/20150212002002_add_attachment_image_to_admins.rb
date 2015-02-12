class AddAttachmentImageToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :admins, :image
  end
end
