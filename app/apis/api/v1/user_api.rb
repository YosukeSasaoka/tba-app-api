
module API
  module V1
    class UserApi < Grape::API
      # http://localhost:3000/api/v1/users/
      resources :users do

        # http://localhost:3000/api/v1/users
        desc 'create user'
        params do
          requires :uuid, type: String, desc: 'An uuid of new App user'
        end
        post do
          user = User.new( uuid: params[:uuid] )
          api_key = ApiKey.generate
          # userとapi_keyを関連付ける
          user.api_keys << api_key

          user.save!

          {
            uuid: user.uuid,
            token: api_key.access_token
          }
        end

      end
    end
  end
end
