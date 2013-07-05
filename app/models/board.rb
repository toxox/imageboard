class Board < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name
  has_many :discussions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 25 }
  validates :short_name, presence: true, length: { maximum: 5 }
end