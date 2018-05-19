class Company < User
  has_secure_password

  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }

  def self.find_or_create_with_form(params)
    user = User.find_by(email: params[:email])
    unless user
      user = User.new
      user.assign_attributes({
        name: params[:name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation],
        address: params[:address],
        number: params[:number],
        phone_number: params[:phone_number],
        document_number: params[:document_number]
      })
      user.save!
    end
    user
  end
end
