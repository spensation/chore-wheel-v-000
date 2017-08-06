class CycleController < ApplicationController

  get '/cycle' do
    erb :'/cycles/show'
  end
end
