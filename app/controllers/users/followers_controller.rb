class User::FollowersController < ApplicationController
    def index
        @user = User.find_by(params[:id])
        @users = @user.followers
    end
end
