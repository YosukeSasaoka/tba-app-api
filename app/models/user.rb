class User < ApplicationRecord
  has_many :api_keys, dependent: :destroy
end
