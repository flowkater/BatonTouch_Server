class CreateGiftitems < ActiveRecord::Migration
  def change
    create_table :giftitems do |t|
      t.string :name # item 이름
      t.string :image # item 이미지 주소
      t.text :description # item 설명
      t.date :fromdate # 유효기간 부터
      t.date :todate # 유효기간 까지
      t.float :price # 쿠키
      t.integer :store_id # 상점 정보

      t.timestamps
    end
  end
end
