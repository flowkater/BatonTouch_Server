class CreateCukilogs < ActiveRecord::Migration
  def change
    create_table :cukilogs do |t|
      t.string :date
      t.string :statement
      t.string :addminus

      t.timestamps
    end
  end
end
