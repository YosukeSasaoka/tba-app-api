# coding: utf-8
require('securerandom')

class ApiKey < ApplicationRecord
  belongs_to :user
  validates :access_token, presence: true
  scope :enabled, -> {where(status: ApiKey::STATUS[:enabled])}

  STATUS = {
    disabled: 0,
    enabled: 1
  }

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  class << self
    # 初期化されたインスタンスを生成
    def generate
      api_key = ApiKey.new
      api_key.generate_access_token
      api_key.status = ApiKey::STATUS[:enabled]
      api_key
    end

    # Tokenを取得->Userモデルを返す
    def authenticate(token)
      token = ApiKey.joins(:user).includes(:user).enabled.find_by(access_token: token)
      return nil unless token
      token.user
    end
  end

end
