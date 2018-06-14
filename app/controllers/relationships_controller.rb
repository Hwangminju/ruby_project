class RelationshipsController < ApplicationController
    def follow_user
        @user = User.find_by(id: params[:id])
        current_user.following_relationships.create(following_id: @user.id)
        redirect_to profile_path
    end

    def unfollow_user
        current_user.following_relationships.find_by(params[:following_id]).destroy
        redirect_to profile_path
    end
end
