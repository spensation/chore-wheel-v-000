require 'pry'
require 'rack-flash'
class CycleController < ApplicationController
  use Rack::Flash

  get '/cycles/new' do
    if logged_in?
      @chores = Chore.all
      @users = User.all
      erb :'/cycles/new'
    else
      redirect '/'
    end
  end

  post '/cycles' do
    @cycle = Cycle.new(user_id: params[:cycle][:user_id], chore_id: params[:cycle][:chore_id])
    binding.pry
    if @cycle.save
      redirect "/cycles/:id"
    else
      redirect "login"
    end
  end

  get '/cycles/:id' do
    if current_user_logged_in?
      @cycle = Cycle.find_by(params[:id])
      @user = User.find_by(params[:id])
      @cycle.chore = Chore.find_by(params[:id])
      #binding.pry
      erb :'/cycles/show'
    else
      redirect '/'
    end
  end

end
