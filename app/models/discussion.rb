class Discussion < ActiveRecord::Base
  include EmptyNameHelper
  before_save :set_name_to_anon_if_empty
  before_create :set_last_post_at

  has_many :posts, dependent: :destroy
  belongs_to :board

  validates :comment, presence: true, length: { maximum: 5000 }
  validates :subject, presence: true, length: { maximum: 50 }
  validates :name, length: { maximum: 30 }
  validates :board_id, presence: true, numericality: true

  private

  def set_last_post_at
    self.last_post_at = self.created_at || Time.now
  end
end