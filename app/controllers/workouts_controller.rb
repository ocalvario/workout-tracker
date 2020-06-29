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
  
  patch "/workouts/:id" do
    @workout = Workout.find(params[:id])
    @workout.update()
    redirect "/workouts/:id"
  end

  
# # GET: /workouts/new
  # post "/workouts/new.html" do
  #   @workout = Workout.create(name: params[:name], date: params[:date])
  #   erb :"/workouts/index.html"
  # end


#   # DELETE: /workouts/5/delete
#   delete "/workouts/:id/delete" do
#     redirect "/workouts"
#   end
end
