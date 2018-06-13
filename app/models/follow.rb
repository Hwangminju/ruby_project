class Follow < ApplicationRecord
    # 팔로우 신청한 유저 
    # 관계 이름 : follower 
    # 모델 명 : User 
    belongs_to :follower, class_name: "User" 
    
    # 팔로우 신청 받은 유저 
    # 관계 이름 : followed 
    # 모델 명 : User 
    belongs_to :followed, class_name: "User"

end
