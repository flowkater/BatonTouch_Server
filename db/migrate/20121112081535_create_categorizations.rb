class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.references :category
      t.references :task

      t.timestamps
    end
    add_index :categorizations, :category_id
    add_index :categorizations, :task_id
  end
end
