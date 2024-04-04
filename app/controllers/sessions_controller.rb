class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Current user: #{Current.user.inspect}"
      redirect_to root_path, notice: "Logged in successfully!"
    else
      flash[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    puts "Current user before logout: #{Current.user.inspect}"
    session[:user_id] = nil
    puts "Current user after logout: #{Current.user.inspect}"
    redirect_to root_path, notice: "Logged out"
  end
end
