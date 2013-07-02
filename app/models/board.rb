class Board < ActiveRecord::Base
  has_many :discussions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 25 }
  validates :short_name, presence: true, length: { maximum: 5 }
end