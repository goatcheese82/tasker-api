class ApplicationController < ActionController::API
    before_action :authorize_request
    attr_reader :current_user

    private

    def authorize_request
        @current_user = (AuthorizeRequest.new(request.headers).call)[:user]
    end

end
