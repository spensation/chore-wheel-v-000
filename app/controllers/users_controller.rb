require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

    get "/signup" do
      erb :'/users/new'
    end

    post "/signup" do
      @user = User.new(:username => params[:user][:username], :email => params[:user][:email], :password => params[:user][:password])

      if @user.save
        session[:user_id] = @user.id
        redirect "/chores"
      else
        redirect "/signup"
      end
    end

    get '/users/:id' do
      if logged_in? && current_user_logged_in?
        @user = current_user
        @chore = Chore.find_by_slug(params[:slug])
        erb :'users/show'
      else
        redirect "/login"
      end
    end

    patch '/users/:id' do
      erb :'/users/done'
    end

end
