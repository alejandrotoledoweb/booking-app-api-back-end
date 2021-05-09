class AuthenticateRepresenter
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      name: user.name,
      email: user.email,
      token: AuthenticationTokenService.call(user.id)
    }
  end
end
