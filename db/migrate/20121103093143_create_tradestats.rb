class CreateTradestats < ActiveRecord::Migration
  def change
    create_table :tradestats do |t|
    	t.integer :status
    	t.integer :user_id
    	t.integer :task_id

      t.timestamps
    end
  end
end
