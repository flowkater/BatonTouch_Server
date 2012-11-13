class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name  # 이름
      t.text :description # 설명
      t.string :fromloc # 여기에서
      t.string :toloc # 여기로
      t.string :spendtime # 소비시간
      t.datetime :calldate # 연락주는 시간
      t.datetime :enddate # 끝나는 시간
      t.integer :status, null: false, default: 0 # 상태
      # status 
      #  0  : 대기중
      #  1  : 진행중
      #  2  : 클라이언트 완료 --
      #  3  : Task 완료 -- 2, 3 똑같은 완료 상태
      #  -1 : 만료
      # etc : Error
      t.references :user # 생성한 유저 정보

      t.timestamps
    end
  end
end
