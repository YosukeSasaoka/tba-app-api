
module API
  module V1
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1', using: :path
      format :json

      helpers do
        def current_user
          @current_user = ApiKey.authenticate(params[:token])
          @current_user
        end

        def authenticate!
          error!('401 Unauthorized : invalid token', 401) unless current_user
        end
      end

      mount API::V1::UserApi
    end
  end
end
