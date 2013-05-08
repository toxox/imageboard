class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name
      t.string :subject
      t.text :comment

      t.timestamps
    end
  end
end
