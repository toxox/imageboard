class Post < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty

  belongs_to :discussion



  validates :comment, presence: true
end
