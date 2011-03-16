#coding : utf-8
class PostFile < ActiveRecord::Base  
  has_attached_file :file,  
    :styles => {
      :thumb => "140x140#",
      :small => "400>",
      :normal => "600>" },
    :default_style => :normal,
    :url => "/upload/:attachment/:date_path/:style_:hash_name.:extension",
    :path => ":rails_root/public/upload/:attachment/:date_path/:style_:hash_name.:extension",
    :default_url => "default/files/:style.jpg",
    :whiny => false
      
  validates_attachment_presence :file, :message => "不能为空"
  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png', 'image/pjpeg'], :message => "只能是图片"
  validates_attachment_size :file, :less_than => 2.megabytes, :message => "不能大于 2M"
end
