class AddStickyToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :sticky, :boolean, default: false
  end
end
