require 'rack-flash'
class CycleController < ApplicationController
  use Rack::Flash

  get '/cycle/new' do
    if logged_in?
      erb :'/cycles/new'
    else
      redirect '/'
    end
  end


  get '/cycle/:id' do
    if current_user_logged_in?
      erb :'/cycles/show'
    else
      redirect '/'
    end
  end
end
