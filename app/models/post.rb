class Post < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty
  after_save :update_discussion_last_post_at

  belongs_to :discussion

  validates :discussion_id, presence: true, numericality: true
  validates :comment, presence: true, length: { maximum: 5000 }

  private

  def bump_limit_reached?
    self.discussion.posts.count > 300
  end

  def update_discussion_last_post_at
    unless bump_limit_reached?
      self.discussion.touch(:last_post_at) if self.discussion
    end
  end
end