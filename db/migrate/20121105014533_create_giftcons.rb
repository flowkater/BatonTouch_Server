class CreateGiftcons < ActiveRecord::Migration
  def change
    create_table :giftcons do |t|
      t.string :authkey # 기프트콘 인증키
      t.integer :giftconable_id
      t.string :giftconable_type

      t.timestamps
    end
  end
end
