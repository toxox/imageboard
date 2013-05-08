class Discussion < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :comment, :subject, presence: true
  validates :comment, length: { maximum: 1000 }
  validates :subject, length: { maximum: 25 }
  validates :name, length: { maximum: 15 }
end
