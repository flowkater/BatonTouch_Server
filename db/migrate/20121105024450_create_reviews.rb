class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :star # 별 개수
      t.integer :user_id
      t.integer :target_id
      t.integer :task_id
      t.integer :status # status 에 따라서 유저가 클라이언트냐, 클라이언트가 유저에게 쓴거냐 구분

      t.timestamps
    end
  end
end
