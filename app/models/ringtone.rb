class Ringtone < ActiveRecord::Base
  
  # 这里两者是等价的，所以 :tag 不是必须的
  # acts_as_taggable # Alias for
  # acts_as_taggable_on :tags
  # rails3 autocomplete 和 ActAsTaggble的解决方案是 SO 上找到的

  attr_accessible :name, :tag, :attachment, :tag_list
  acts_as_taggable_on :tags

  mount_uploader :attachment , AudioattachmentUploader

  validates_presence_of :name, on: :create, message: "can't be blank"
  # validates_presence_of :attachment, on: :create, message: "attachment please"
  
  # as 用在多态的地方
  # has_many :attachments, as: :attachmentable
  before_save :set_attachment_attributes
  # before_save :set_tag
  
  def tag_list_to_autocomplete
    # %w(this is cool)
    "cool"
    # Ringtone.tag_counts_on(:tags)
  end

  protected
  def set_tag 
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


