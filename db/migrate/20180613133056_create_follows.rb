class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      
      # follower: 팔로우를 신청한 사람 
      # followed: 팔로우 신청을 받은 사람 
      t.integer :follower_id 
      t.integer :followed_id 
      
      t.timestamps
    end
    add_index :follows, :follower_id 
    add_index :follows, :followed_id 
    add_index :follows, [:follower_id, :followed_id], unique: true

  end
end
