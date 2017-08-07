require 'pry'
class SessionsController < ApplicationController

  get '/login' do
    if current_user_logged_in?
      @user = current_user
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Please enter a valid username and password."
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    #binding.pry
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      erb :'/cycles/show'
    else
      redirect "/login"
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect "/"
    else
      redirect "/login"
    end
  end
end
