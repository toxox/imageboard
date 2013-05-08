class Discussion < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty

  has_many :posts, dependent: :destroy



  validates :comment, :subject, presence: true
  validates :comment, length: { maximum: 1000 }
  validates :subject, length: { maximum: 25 }
  validates :name, length: { maximum: 15 }
end
