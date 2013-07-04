class AddLastPostAtToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :last_post_at, :datetime
  end
end
