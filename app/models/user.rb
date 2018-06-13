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
  
  # 관계 이름 : follower_relations(다른 이름으로 변경 가능) 
  # 외래키 : followed_id 
  # 모델명 : Follow 
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  
  # 관계 이름 : followers (다른 이름으로 변경 가능) 
  # follow_relations를 통해 가져올 값 : follower ( follow.follower ) 
  has_many :followers, through: :follower_relations, source: :follower

  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow" 
  has_many :followings, through: :following_relations, source: :followed
  
  mount_uploader :avatar, AvatarUploader
end
