class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end
    add_index :pictures, [:imageable_id, :imageable_type]
  end
end
