class User::FollowingsController < ApplicationController
    def index
        @user = User.find_by(params[:id])
        @users = @user.followings
    end
end
