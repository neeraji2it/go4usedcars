class ShareFb < ActiveRecord::Base
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'],hash['uid'])
  end
  
  def self.find_or_create(auth_hash)
    unless user = User.find_by_email(auth_hash['info']['email'])
      email = auth_hash['info']['email']
      provider = auth_hash['provider']
      uid = auth_hash['uid']
      secret = auth_hash['secret']
      secret_token = auth_hash['credentials'].try(:"[]", "token")
      user = ShareFb.new :email => email, :uid => uid, :provider => provider, :secret => secret, :secret_token => secret_token
      user.save(:validate => false)
    end
    return user
  end
end
