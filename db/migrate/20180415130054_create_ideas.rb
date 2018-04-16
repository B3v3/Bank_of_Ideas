class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|

      t.string :title
      t.text :body
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :ideas, [:user_id, :created_at]
  end
end
