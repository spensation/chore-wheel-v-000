require 'pry'
require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

    get "/users" do
      @users = User.all
      erb :'/users/index'
    end

    get "/signup" do
      erb :'/users/new'
    end

    post "/signup" do
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end

    get '/users/:id' do
      if logged_in? && current_user_logged_in?
        @user = current_user
        @chore = Chore.find_by_slug(params[:slug])
        erb :'users/show'
      else
        flash[:message] = "Private user's page.  Please log in as user to view"
        redirect "/login"
      end
    end

    patch '/users/:id' do
      erb :'/users/done'
    end

end
