
module API
  module V1
    class UserApi < Grape::API
      # http://localhost:3000/api/v1/users/
      resources :users do
      end
    end
  end
end
