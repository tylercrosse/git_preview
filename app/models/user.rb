class User < ActiveRecord::Base
  
  def self.create_from_omniauth(auth_hash)
    self.create(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid],
      name: auth_hash[:info][:name],
      nickname: auth_hash[:info][:nickname],
      image: auth_hash[:info][:image],
      url: auth_hash[:extra][:raw_info][:html_url],
    )
  end
end
