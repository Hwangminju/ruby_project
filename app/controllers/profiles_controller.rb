class ProfilesController < ApplicationController
    def show 
        @user = User.find_by(id: params[:id])
        if @user
            @posts = @user.posts.order('created_at DESC')
            render actions: :show
        else
            render file: 'public/404', status: 404, formats: [:html]
        end
    end
end
