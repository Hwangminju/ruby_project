class RelationshipsController < ApplicationController
    def follow_user
        @user = User.find(params[:relationship][:following_id])
        current_user.follow!(@user)
        redirect_to @user
    end

    def unfollow_user
        current_user.following_relationships.find_by(params[:following_id]).destroy
    end
end
