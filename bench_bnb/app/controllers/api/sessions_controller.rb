class Api::SessionsController < ApplicationController

    def create
        @user= User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login(@user)
            render "api/users/show"
        else
            render json: ["Invalid username/password"], status: 401
        end
    end 

    def destroy
        render json: {}, status: 404
    end 
end
