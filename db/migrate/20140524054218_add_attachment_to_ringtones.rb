class AddAttachmentToRingtones < ActiveRecord::Migration
  def change
    add_column :ringtones, :attachment, :string
  end
end
