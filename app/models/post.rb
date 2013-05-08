class Post < ActiveRecord::Base
  belongs_to :discussion

  validates :comment, presence: true
end
