class Ringtone < ActiveRecord::Base
  
  # this tag here store all Ringtone tag_list for autoacomplete since :tag_list is hardly to make it work
  # todo rename :tag to :alltags
  attr_accessible :name, :tag, :attachment, :tag_list
  acts_as_taggable

  mount_uploader :attachment , AudioattachmentUploader

  validates_presence_of :name, on: :create, message: "can't be blank"
  # validates_presence_of :attachment, on: :create, message: "attachment please"
  
  # as 用在多态的地方
  # has_many :attachments, as: :attachmentable
  before_save :set_attachment_attributes
  before_save :set_tag

  protected

  def set_tag 
    # binding.pry
    # self.tag = self.tag_list.to_s
    self.tag = ""
    Ringtone.tag_counts_on(:tags).map do |tag| 
      # binding.pry
      self.tag+=tag.name.to_s << ","
    end
  end

  # 这里的 attachment 不是 :string 那个字段吗？
  def set_attachment_attributes 
  	# if attachment.present? && attachment.changed?
  	# if attachment.present?
  	# 	self.content_type = attachment.file.content_type
  	# 	self.file_size  = attachment.file.size
  	# 	self.file_name = attachment.file.original_filename
  	# end
  end

end


