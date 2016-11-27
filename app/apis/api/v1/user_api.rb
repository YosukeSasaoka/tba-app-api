
module API
  module V1
    class UserApi < Grape::API
      # http://localhost:3000/api/v1/users/
      resources :users do

        # http://localhost:3000/api/v1/users/test/post
        desc 'test for post'
        params do
          requires :text, type: String
        end
        post '/test/post' do
          puts params[:text]
        end

      end
    end
  end
end
