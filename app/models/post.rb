class Post < ActiveRecord::Base
  include EmptyNameHelper
  mount_uploader :image, ImageUploader
  before_save :set_name_to_anon_if_empty
  after_save :update_discussion_last_post_at

  belongs_to :discussion

  validates :name, length: { maximum: 25 }
  validates :discussion_id, presence: true, numericality: true
  validates :comment, presence: true, length: { maximum: 5000 }
  validate :discussion_is_not_closed

  def discussion_is_not_closed
    if self.discussion.closed
      errors.add(:discussion, "is closed.")
      return false
    end
  end

  private

  def bump_limit_reached?
    self.discussion.posts.count > 300
  end

  def update_discussion_last_post_at
    unless bump_limit_reached? || self.no_bump
      self.discussion.touch(:last_post_at) if self.discussion
    end
  end
end