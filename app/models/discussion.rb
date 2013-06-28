class Discussion < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty

  has_many :posts, dependent: :destroy

  validates :comment, presence: true, length: { maximum: 5000 }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :name, length: { maximum: 30 }
end