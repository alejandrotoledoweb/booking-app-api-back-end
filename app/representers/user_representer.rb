class UserRepresenter
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

  private

  attr_reader :user
end
