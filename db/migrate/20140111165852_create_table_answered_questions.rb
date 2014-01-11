class CreateTableAnsweredQuestions < ActiveRecord::Migration
  def change
    create_table :answered_questions do |t|
      t.integer :user_id, null: false
      t.integer :quesiton_id, null: false

      t.timestamps
    end
  end
end
