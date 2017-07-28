class UsersController < ApplicationController

    get "/signup" do
      erb :'/users/new'
    end

    post "/signup" do
      @user = User.new(:username => params[:user][:username], :email => params[:user][:email], :password => params[:user][:password])

      if !params[:user][:username].empty? && !params[:user][:email].empty? && @user.save
        session[:user_id] = @user.id
        redirect "/chores"
      else
        redirect "/signup"
      end
    end

    get '/users/:id' do
      @user = User.find_by_id(params[:id])
      erb :'/users/show'
    end

    delete '/users/:id' do
      @user = User.find_by_id(params[:id])
      @user.destroy
      redirect "/chores"
    end
end
