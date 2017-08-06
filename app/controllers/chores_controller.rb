require 'pry'
require 'rack-flash'
class ChoresController < ApplicationController
  use Rack::Flash

  get '/chores' do
    if logged_in?
      @chores = Chore.all
      erb :'/chores/index'
    else
      redirect '/login'
    end
  end

  get '/chores/new' do
    if logged_in?
      @chores = Chore.all
      erb :'/chores/new'
    else
      redirect '/login'
    end
  end

  post '/chores' do
    @chore = Chore.create(title: params[:chore][:title])
    #binding.pry
    @chore.task_ids = params["tasks"]

    if @chore.save
      flash[:message] = "Successfully created chore."

      redirect to "chores/#{@chore.slug}"
    else
      flash[:message] = "There was a problem. Please try that again."

      erb :'chores/new'
    end
  end

  get '/chores/:slug' do
    if !current_user_logged_in?
      flash[:massage] = "This page is resticted to user's access only"
      redirect '/chores'
    else
      @chore = Chore.find_by_slug(params[:slug])
      erb :'/chores/show'
    end
  end

  get '/chores/:slug/edit' do
    if !current_user_logged_in?
      flash[:masseage] = "This page is resticted to user's access only"
      redirect '/login'
    else
      @chore = Chore.find_by_slug(params[:slug])
      erb :'chores/edit'
    end
  end

  patch '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    @chore.update(title: params[:chore][:title])
    @chore.task_ids = params["tasks"]
    if @chore.save
      flash[:message] = "Successfully edited chore."
      redirect "chores/#{@chore.slug}"
    else
      flash[:message] = "There seems to be a problem. Please try that again"
      redirect "/chores/:slug/edit"
    end
  end

  delete '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    @chore.destroy
    redirect "/chores"
  end
end
