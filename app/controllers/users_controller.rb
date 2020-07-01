class UsersController < ApplicationController

  get "/signup" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :"/users/new.html"
    end
  end
  
  post "/signup" do
    if params.any? {|k, v| v.empty?}
       flash[:alert] = "Please enter all required fields"
         redirect "/signup"
    else
        @user = User.create(
        username: params[:username], 
        password: params[:password]
        )
        if @user.valid?
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        else 
          flash[:alert] = "Username already in use, please login."
          redirect "/login"
      end 
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
      flash[:alert] = "Incorrect credentials, please try again. "
      redirect "/login"
    end
  end 
  
  get '/users/:id' do
    if logged_in? 
      @user = User.find(params[:id])
      erb :'/users/show.html'
     else
      flash[:alert] = "Please login first"
      erb :"users/login.html"
    end
  end 
  
  get '/logout' do
    session.clear
    redirect '/login'
  end 
  
end
