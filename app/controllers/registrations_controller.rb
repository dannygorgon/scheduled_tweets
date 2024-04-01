class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "This is working"
    params
    render plain: params[:user]
  end
end