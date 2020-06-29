class WorkoutsController < ApplicationController

  # GET: /workouts
  get "/workouts" do
      @workouts = Workout.all
    erb :"/workouts/index.html"
  end

  # GET: /workouts/new
  get "/workouts/new.html" do
    @workout = Workout.new  
    erb :"/workouts/new.html"
  end

  # GET: /workouts/new
  post "/workouts/new.html" do
    @workout = Workout.create(name: params[:name], date: params[:date])
    erb :"/workouts/index.html"
  end

  # POST: /workouts
  post "/workouts" do
    redirect "/workouts"
  end

#   # GET: /workouts/5
#   get "/workouts/:id" do
#     erb :"/workouts/show.html"
#   end

#   # GET: /workou_ts/5/edit
#   get "/workouts/:id/edit" do
#     erb :"/workouts/edit.html"
#   end

#   # PATCH: /workouts/5
#   patch "/workouts/:id" do
#     redirect "/workouts/:id"
#   end

#   # DELETE: /workouts/5/delete
#   delete "/workouts/:id/delete" do
#     redirect "/workouts"
#   end
end
