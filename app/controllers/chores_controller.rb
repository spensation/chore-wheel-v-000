require 'pry'
class ChoresController < ApplicationController

  get '/chores' do
    if !session[:user_id]
      redirect "/login"
    else
      @user = User.find(session[:user_id])
      @chores = Chore.all
      erb :'chores/index'

    end
  end

  get '/chores/new' do
    if session[:user_id]
      erb :'/chores/new'
    else
      redirect '/login'
    end
  end

  post '/chores' do
    @chore = Chore.create(title: params[:chore][:title])
    @chore.user = User.find_or_create_by(username: params[:user][:username])
    @chore.task_ids = params["tasks"]

    @chore.save
    redirect to "chores/#{@chore.slug}"
  end

  get '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    erb :'/chores/show'
  end

  get '/chores/:slug/edit' do
    @chore = Chore.find_by_slug(params[:slug])
    erb :'chores/edit'
  end

  patch '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    @chore.update(title: params[:chore][:title])
    @chore.user = User.find_or_create_by(username: params[:user][:username])
    @chore.task_ids = params["tasks"]
    @chore.save
    redirect "chores/#{@chore.slug}"
  end

  delete '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    @chore.destroy
    redirect "/chores"
  end
end
