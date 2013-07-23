class AddNoBumbToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :no_bump, :boolean, default: false
  end
end
