
module API
  module V1
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1', using: :path
      format :json

      helpers do
      end

      mount API::V1::UserApi
    end
  end
end
