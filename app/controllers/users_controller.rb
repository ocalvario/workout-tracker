class UsersController < ApplicationController

  # get "/users" do
  #   erb :"/users/index.html"
  # end

  get "/signup" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :"/users/new.html"
    end
  end
  
  post "/signup" do
    if params[:username] == "" && params[:password] == ""
         redirect "/signup"
    else
      @user = User.create(
        username: params[:username], 
        password: params[:password]
        )
        session[:user_id] = @user.id
        redirect "/users/#{@user.id}"
      end
    end 
  
  get "/login" do
    if logged_in?   
      redirect "/users/#{current_user.id}"    
    else
      erb :"users/login.html"
    end 
  end
  
  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect "/login"
    end
  end 
  
  get '/users/:id' do
    @user = User.find(params[:id])
    erb :'/users/show.html'
  end 
  
  get '/logout' do
    session.clear
    redirect '/login'
  end 
  
end
