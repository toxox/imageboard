class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :discussion_id
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
