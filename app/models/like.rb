class Like < ApplicationRecord
    # Like는 User와 Post의 id를 가지고 있음 
    belongs_to :user 
    belongs_to :post
    
    # counter_cache를 true로 설정하면 네이밍 규칙에 따라 
    # Post 모델의 likes_count 컬럼으로 설정됩니다.
    belongs_to :post, counter_cache: true 

end
