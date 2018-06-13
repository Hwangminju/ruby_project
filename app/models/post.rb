class Post < ApplicationRecord
    belongs_to :user
    
    # Post와 Like는 1:N 관계 
    has_many :likes
    has_many :liked_users, through: :likes, source: :user

end
