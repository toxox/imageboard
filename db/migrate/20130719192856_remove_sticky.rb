class RemoveSticky < ActiveRecord::Migration
  def change
    remove_column :discussions, :sticky
  end
end
