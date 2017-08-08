class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, 'app/views'


  get '/' do
    erb :welcome
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def current_user_logged_in?
      current_user.id == session[:user_id]
    end

    def complete?
      Cycle.complete = true
    end
  end
end
