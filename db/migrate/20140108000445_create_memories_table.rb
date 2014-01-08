class CreateMemoriesTable < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.string :question, null: false
      t.text :body
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
