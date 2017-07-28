class TasksController < ApplicationController

  get '/tasks' do
    @tasks = Task.all
    erb :'/tasks/index'
  end

  post '/tasks' do
    Task.create(title: params[:title])
    erb :'/tasks/index'
  end
  
end
