class AddNumberOfDiscussionsToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :number_of_discussions, :integer
  end
end
