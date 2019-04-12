class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :index

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.create!(user_params)
        auth_token = AuthenticateUser.new(user.email, user.password).call
        response = { auth_token: auth_token }
        render json: response
    end

    def update
    end

    def delete
    end

    private


    def user_params
        params.permit(
            :first_name,
            :last_name,
            :email,
            :username,
            :password
        )
    end
end
