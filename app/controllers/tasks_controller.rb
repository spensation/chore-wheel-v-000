class TasksController < ApplicationController

  get '/tasks' do
    if logged_in?
      @tasks = Task.all
      erb :'/tasks/index'
    else
      redirect "/login"
    end
  end

  post '/tasks' do
    Task.create(title: params[:title])
    erb :'/tasks/index'
  end

end
