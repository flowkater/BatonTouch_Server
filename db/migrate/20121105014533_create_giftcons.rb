class CreateGiftcons < ActiveRecord::Migration
  def change
    create_table :giftcons do |t|
      t.string :authkey # 기프트콘 인증키
      t.integer :store_id # 점포별로 나눠짐
      t.integer :item_id # 아이템 별 아이디
      t.integer :task_id
      t.integer :client_id

      t.timestamps
    end
  end
end
