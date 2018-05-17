class Common < User
  def self.find_or_create_with_omniauth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
    user.save!
    user
  end
end
