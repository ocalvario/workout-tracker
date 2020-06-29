class UsersController < ApplicationController

  get "/users" do
    erb :"/users/index.html"
  end

  get "/signup" do
    erb :"/users/new.html"
  end
  
  post "/signup" do
    #params[:username]
    #params[:password]
    @user = User.create(username: params[:username], password: params[:password])
    redirect "/users/#{@user.id}"
  end

  get "/login" do
    erb :"users/login.html"
  end 
  
  post "/login" do
    redirect "/workouts"
  end

#   # POST: /users
#   post "/users" do
#     redirect "/users"
#   end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
end
