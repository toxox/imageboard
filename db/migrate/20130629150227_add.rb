class Add < ActiveRecord::Migration
  def change
    add_column :discussions, :board_id, :integer
  end
end
