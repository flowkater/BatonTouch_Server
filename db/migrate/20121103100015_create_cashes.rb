class CreateCashes < ActiveRecord::Migration
  def change
    create_table :cashes do |t|
    	t.decimal :cookie, null: false, default: 0 #쿠키 초기화 0
    	t.references :cookiable, polymorphic: true

      t.timestamps
    end
    add_index :cashes, [:cookiable_id, :cookiable_type], unique: true
  end
end
