class ExercisesController < ApplicationController

  #create
  
  get "/exercises/new" do
    if logged_in?
      erb :"/exercises/new.html"
    else
      redirect "/login"
    end 
  end

  post "/exercises" do
     if params.any? {|k, v| v.empty?}
       redirect "/exercises/new"
     else 
      @exercise = Exercise.create(
        name: params[:name],
        weight: params[:weight],
        sets: params[:sets],
        reps: params[:reps],
        workout_id: params[:workout_id]
        )
      @workout = Workout.find(@exercise.workout_id)
      @workout.exercises << @exercise
      redirect "/exercises/#{@exercise.id}"
    end 
  end

  #read 
  
  get "/exercises/:id" do
    @exercise = Exercise.find(params[:id])
    erb :"/exercises/show.html"
  end

  #update
  
  get "/exercises/:id/edit" do
    @exercise = Exercise.find(params[:id])
    erb :"/exercises/edit.html"
  end

  patch "/exercises/:id" do
    @exercise = Exercise.find(params[:id])
     if params.any? {|k, v| v.empty?}
       redirect "/exercises/#{@exercise.id}/edit"
     else     
       @exercise.update(
        name: params[:name],
        weight: params[:weight],
        sets: params[:sets],
        reps: params[:reps],
        workout_id: params[:workout_id]
        )
      redirect "/exercises/#{@exercise.id}"
    end
  end

  # delete: 
  delete '/edit/:id/delete' do
    @exercise = Exercise.find(params[:id])
    @exercise.delete
    redirect "/workouts"
  end
  
end
