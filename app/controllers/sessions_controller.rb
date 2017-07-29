require 'pry'
class SessionsController < ApplicationController

  get '/login' do
    if session[:user_id]
      redirect "/chores"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id

      redirect "/chores"
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
