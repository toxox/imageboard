class Board < ActiveRecord::Base
  has_many :discussions, dependent: :destroy
end
