class RelationshipsController < ApplicationController
    def follow_user
        @user = User.find(params[:relationship][:following_id])
        current_user.follow!(@user)
        redirect_to @user
    end

    def unfollow_user
        @user = Relationship.find(params[:id]).following
        current_user.unfollow!(@user)
        redirect_to @user
    end
end
