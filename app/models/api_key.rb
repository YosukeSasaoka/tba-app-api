require('securerandom')

class ApiKey < ApplicationRecord
  belongs_to :user
  validates :access_token, presence: true

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
      # これを忘れて1時間苦しんだ。。。
      api_key
    end
  end

end
