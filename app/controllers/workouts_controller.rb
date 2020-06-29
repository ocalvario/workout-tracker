class WorkoutsController < ApplicationController

  #create
  
  get "/workouts/new.html" do
    erb :"/workouts/new.html"
  end
  
  post "/workouts" do
    @workout = Workout.create(
      name: params[:name], 
      date: params[:date]
      )
     redirect "/workouts/#{@workout.id}" 
  end

  #read
  
  get "/workouts/:id" do
    @workout = Workout.find(params[:id])
    erb :"/workouts/show.html"
  end

  get "/workouts" do
    @workouts = Workout.all
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
    @order.delete
    redirect "/workouts"
  end
end
