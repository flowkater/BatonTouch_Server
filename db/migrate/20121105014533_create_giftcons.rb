class CreateGiftcons < ActiveRecord::Migration
  def change
    create_table :giftcons do |t|
      t.string :authkey # 기프트콘 인증키
      t.integer :store_id # 점포별로 나눠짐
      t.integer :giftitem_id # 아이템 별 아이디
      t.integer :task_id # 생성된 task 의 아이디
      t.integer :client_id #전달받는 client_id
      t.boolean :status, null:false, default: false

      t.timestamps
    end
  end
end
