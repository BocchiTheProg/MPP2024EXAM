class GreetingService
  def initialize(user_name)
    @user_name = user_name
  end

  def call
    greet_user
  end

  private

  def greet_user
    "Hello, #{@user_name}!"
  end
end
