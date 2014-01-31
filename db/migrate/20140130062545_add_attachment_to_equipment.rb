class AddAttachmentToEquipment < ActiveRecord::Migration
  def change
    add_attachment :equipment, :image
  end
end
