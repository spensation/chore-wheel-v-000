require 'pry'
require 'rack-flash'
class CycleController < ApplicationController
  use Rack::Flash

  get '/cycles/new' do
    if current_user_logged_in?
      @chores = Chore.all
      @user = current_user
      erb :'/cycles/new'
    else
      redirect '/'
    end
  end

  post '/cycles' do
    @cycle = Cycle.create(params[:cycle])
    @cycle.user = User.find_or_create_by(id: params[:user_id])
    @cycle.chore = Chore.find_or_create_by(id: params[:chore_id])

    if @cycle.save
      redirect "/cycles/#{@cycle.id}"
    else
      redirect "login"
    end
  end

  get '/cycles/:id' do
    if current_user_logged_in?
      @user = current_user
      @cycle = Cycle.find_by_id(params[:id])

      erb :'/cycles/show'
    else
      redirect '/'
    end
  end

  patch '/cycles/:id' do
    if current_user_logged_in?
      @user = current_user
      binding.pry
      @cycle.update(params[:cycle])
      flash[:message] = "Way to go!  Your roommates have all been informed of your legendary status."
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "restricted action"
      redirect "/"
    end
  end
end
