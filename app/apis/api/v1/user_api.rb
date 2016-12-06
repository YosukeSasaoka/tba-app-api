
module API
  module V1
    class UserApi < Grape::API
      # http://localhost:3000/api/v1/users/
      resources :users do

        # http://localhost:3000/api/v1/users/me
        desc 'show user'
        params do
        end
        get '/me' do
          authenticate!

          {
            uuid: current_user.uuid,
          }
        end

        # http://localhost:3000/api/v1/users/me/name
        desc 'update user'
        params do
          requires :name, type: String, desc: 'test for put'
        end
        put '/me/name' do
          authenticate!

          # ReadOnlyRecordで怒られるから他でsave!
          # joinsしてるからreadonly(false)で治る
          @current_user.update_user_name!(params[:name])

          {
            name: @current_user.name
          }

        end

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
