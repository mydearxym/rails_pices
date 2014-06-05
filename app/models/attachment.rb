class Attachment < ActiveRecord::Base
  attr_accessible :attachment, :attachmentable_id, :attachmenttable_type, :content_type, :file_name, :file_size

  # xym add 
  mount_uploader :attachment, AttachmentUploader # 将 attachment 字段交给 AttachmentUploader 这个类来处理
  belongs_to :attachmentable, :polymorphic => true # 没搞懂
  validates_presence_of :attachmentable
  validates_presence_of :attachment

  before_save :set_attachment_attributes

  protected
  # 这里的 attachment 不是 :string 那个字段吗？
  def set_attachment_attributes
  	# if attachment.present? && attachment_changed?
  	if attachment.present? && attachment. changed?
  		self.content_type = attachment.file.content_type
  		self.file_size  = attachment.file.size
  		self.file_name = attachment.file.original_filename
  end

end
