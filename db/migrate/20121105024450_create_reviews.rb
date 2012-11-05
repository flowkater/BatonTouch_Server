class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :target_id
      t.integer :status

      t.timestamps
    end
  end
end
