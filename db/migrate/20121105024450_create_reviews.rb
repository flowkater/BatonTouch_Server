class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :star # 별 개수
      t.integer :user_id
      t.integer :target_id # 리뷰가 쓰여지는 상대 정보
      t.integer :task_id
      t.integer :status, null: false # status 에 따라서 유저가 클라이언트냐, 클라이언트가 유저에게 쓴거냐 구분
      # 0 - User -> Client
      # 1 - Client -> User
      # Client 가 User 에게 할때는 항목을 create

      t.timestamps
    end
  end
end
