class AddImageToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :image, :string
  end
end
