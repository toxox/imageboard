class AddClosedToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :closed, :boolean, default: false
  end
end
