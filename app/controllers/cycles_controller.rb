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
    @cycle = Cycle.create(params[:cycle])
    @cycle.user = User.find_by(params[:user_id])
    @cycle.chore = Chore.find_by(params[:chore_id])

    if @cycle.save
      redirect "/cycles/#{@cycle.id}"
    else
      redirect "login"
    end
  end

  get '/cycles/:id' do
    if current_user_logged_in?
      @cycle = Cycle.find_by_id(params[:id])
      binding.pry
      erb :'/cycles/show'
    else
      redirect '/'
    end
  end

end
