class Post < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty

  belongs_to :discussion

  validates :discussion_id, presence: true, numericality: true
  validates :comment, presence: true, length: { maximum: 5000 }
end
