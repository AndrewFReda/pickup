class User < ActiveRecord::Base
  has_one :player

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      binding.pry
      if user.player.nil?
        player = Player.new
        player.name = user.name
        player.user_id = user.id
        player.save!
        user.player = player
      end
      user.save!
    end
  end

end
