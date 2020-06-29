class WorkoutsController < ApplicationController

  #create
  
    get "/workouts/new.html" do
      if logged_in?
        erb :"/workouts/new.html"
      else
        redirect "/login"
      end
    end 
    
    post "/workouts" do
      @workout = Workout.create(
        name: params[:name], 
        date: params[:date]
        )
        current_user.workouts << @workout
       redirect "/workouts/#{@workout.id}" 
    end

  #read
  
    get "/workouts/:id" do
      @workout = Workout.find(params[:id])
      erb :"/workouts/show.html"
    end
  
    get "/workouts" do
      @user = current_user
      @workouts = current_user.workouts
      erb :"/workouts/index.html"
    end
  
  #update
  
    get "/workouts/:id/edit" do
      @workout = Workout.find(params[:id])  
      erb :"/workouts/edit.html"
    end
    
    post "/workouts/:id" do
      @workout = Workout.find(params[:id])
      @workout.update(
        name: params[:name], 
        date: params[:date]
        )
      redirect "/workouts/#{@workout.id}"
    end

  #delete
  
    delete "/workouts/:id/delete" do
      @workout = Workout.find(params[:id])
      @order.destroy
      redirect "/workouts"
    end
    
    post  "/workouts/:id/delete" do
      redirect "/workouts"
    end
end
