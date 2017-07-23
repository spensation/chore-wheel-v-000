class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get "/signup" do
    if session[:user_id]
      redirect "/chores"
    else
      erb :'/users/create_user'
    end
  end

  post "/signup" do
    @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])

    if !params[:username].empty? && !params[:email].empty? && @user.save
      session[:user_id] = @user.id
      redirect "/chores"
    else
      redirect "/signup"
    end
  end

  get '/chores' do
    if !session[:user_id]
      redirect "/login"
    else
      @user = User.find(session[:user_id])
      @chores = Chore.all
      erb :'chores/chores'
    end
  end

  get '/login' do
    if session[:user_id]
      redirect "/chores"
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect "/chores"
    else
      redirect "/login"
    end
  end

  get '/chores/new' do
    if session[:user_id]
      erb :'/chores/create_chore'
    else
      redirect '/login'
    end
  end

end
