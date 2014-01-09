class CreateTopicTable < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title, null: false

      t.timestamps
    end
  end
end
