class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  
  # User와 Like는 1:N 관계 
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_many :comments

  def is_like?(post) 
    Like.find_by(user_id: self.id, post_id: post.id).present? 
  end
  
  has_many :follower_relationships, foreign_key: "following_id", class_name:  "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :following, through: :following_relationships, source: :following
  
  mount_uploader :avatar, AvatarUploader
  
  #해당유저가 other_user를 팔로우 하고 있는지 true/false(화면설계 4에서 설명한 팔로우한 상태일경우 언팔로우 버튼을 보여주기 위해)
  def following?(other_user)
      following_relationships.find_by(following_id: other_user.id)
  end
  
  #특정유저가 other_user를 팔로우(팔로우 버튼을 클릭시 Relationship에 해당 정보를 insert하는 로직)
  def follow!(other_user)
      following_relationships.create!(following_id: other_user.id)
  end
  
  #특정유저가 other_user를 언팔로우(언팔로우 버튼을 클릭시 Relationship에 해당 정보를 delete하는 로직)
  def unfollow!(other_user)
      following_relationships.find_by(following_id: other_user.id).destroy
  end
end
