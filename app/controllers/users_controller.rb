class UsersController < ApplicationController

    get "/signup" do
      if session[:user_id]
        redirect "/chores"
      else
        erb :'/users/create_user'
      end
    end

    post "/signup" do
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])

      if !params[:username].empty? && !params[:email].empty? && @user.save
        session[:user_id] = @user.id
        redirect "/chores"
      else
        redirect "/signup"
      end
    end

end
