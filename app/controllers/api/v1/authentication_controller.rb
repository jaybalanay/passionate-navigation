module Api
  module V1
    class AuthenticationController < ApiController
      skip_before_action :authenticate_request

      def authenticate
        authenticate_user_client = AuthenticateUser.call(params[:email], params[:password])

        if authenticate_user_client.success?
          render json: { token: authenticate_user_client.result }
        else
          render json: { error: authenticate_user_client.errors }, status: :unauthorized
        end
      end
    end
  end
end
