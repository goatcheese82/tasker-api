class UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def index
    end

    def create
        user = User.create!(user_params)
        auth_token = AuthenticateUser.new(user.email, user.password).call
        response = { message: Message.account_created, auth_token: auth_token }
        json_response(response, :created)
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
            :password,
            :password_confirmation
        )
    end
end
