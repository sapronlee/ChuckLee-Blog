class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true, :counter_cache => :comments_count

  # default_scope :order => 'created_at ASC'  

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  # belongs_to :user
  
  validates_presence_of :name, :comment, :email
  validates_length_of :name, :maximum => 20
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :if => Proc.new { |e| !e.email.blank? } 
  
end
