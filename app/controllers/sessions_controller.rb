require 'pry'
class SessionsController < ApplicationController

  get '/login' do
    # if logged_in?
    #   redirect '/chores'
    # else
    #   flash[:message] = "There was a problem.  Please login again."
      erb :'/users/login'
    # end
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
