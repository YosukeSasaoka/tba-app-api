class User < ApplicationRecord
  has_many :api_keys, dependent: :destroy

  def update_user_name!(new_name)
    return if self.name = new_name
    self.name = new_name
    self.save!
  end
end
