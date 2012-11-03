class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name  # 이름
      t.string :description # 설명
      t.string :fromloc # 여기에서
      t.string :toloc # 여기로
      t.string :spendtime # 소비시간
      t.string :calldate # 연락주는 시간
      t.string :enddate # 끝나는 시간
      t.integer :status # 상태
      t.references :user # 생성한 유저 정보

      t.timestamps
    end
  end
end
