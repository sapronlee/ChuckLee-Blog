class PostImage < ActiveRecord::Base
  has_attached_file :image,
  :sytles => {
    :medium => "300x300>",
    :thumb => "100x100>"
  }
end
