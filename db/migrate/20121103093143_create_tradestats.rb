class CreateTradestats < ActiveRecord::Migration
  def change
    create_table :tradestats do |t|
    	t.boolean :status, null: false, default: false
    	t.integer :client_id
    	t.integer :task_id

      t.timestamps
    end
  end
end
