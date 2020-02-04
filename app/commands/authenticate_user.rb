class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email    = email
    @password = password
    @errors   = []
  end

  def call
    JsonWebToken.encode(user_id: api_user.id) if api_user
  end

  private
  attr_accessor :email, :password, :errors

  def api_user
    user = User.find_by(email: email)
    unless user.present?
      errors << "Invalid email or password"
      return nil
    end

    # Verify the password. You can create a blank method for now.
    unless user.valid_password?(password)
      errors << "Invalid email or password"
      return nil
    end

    return user
  end

end

