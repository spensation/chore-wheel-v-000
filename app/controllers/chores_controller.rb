class ChoresController < ApplicationController

  get '/chores' do
    if !session[:user_id]
      redirect "/login"
    else
      @user = User.find(session[:user_id])
      @chores = Chore.all
      erb :'chores/chores'
    end
  end

  get '/chores/:slug' do
    @chore = Chore.find_by_slug(params[:slug])
    @tasks = Task.all
    erb :'chores/show_chore'
  end

  get '/chores/new' do
    if session[:user_id]
      erb :'/chores/create_chore'
    else
      redirect '/login'
    end
  end

end
