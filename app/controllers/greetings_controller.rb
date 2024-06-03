class GreetingsController < ApplicationController
  def show
    user_name = params[:name] || "Guest"
    greeting_service = GreetingService.new(user_name)
    @greeting_message = greeting_service.call
  end
end
