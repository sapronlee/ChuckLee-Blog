#coding : utf-8
class PostFile < ActiveRecord::Base  
  has_attached_file :file,
  :styles => {:thumb => "100x100#"},
  :whiny => false
  
  validates_presence_of :name
  validates_attachment_presence :file
  validates_attachment_content_type :file, :content_type => ['image/jpg', 'image/jpeg', 'image/pjpeg', 'image/gif', 'image/png', 'image/x-png'], :message => "只能上传图片"  
end
