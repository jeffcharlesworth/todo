class UsersController < ApplicationController
  attr_accessor :password

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
  end

  def delete
  end
end
