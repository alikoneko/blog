class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :status
      t.string :title
      t.text :body
      t.timestamps
    end

    add_index :posts, :status
  end
end
