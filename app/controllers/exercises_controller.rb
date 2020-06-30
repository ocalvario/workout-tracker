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
     @user = current_user
     id = @user.id
     if params.any? {|k, v| v.empty?}
       redirect "/exercises/new"
     else 
      @exercise = Exercise.create(
        name: params[:name],
        weight: params[:weight],
        sets: params[:sets],
        reps: params[:reps],
        workout_id: params[:workout_id],
        user_id: id
        )
      @workout = Workout.find(@exercise.workout_id)
      @workout.exercises << @exercise
      redirect "/exercises/#{@exercise.id}"
    end 
  end

  #read 
  
  get "/exercises/:id" do
    @user = current_user
    id = @user.id
    @exercise = Exercise.find(params[:id])
    reference = @exercise.user_id
    if id == reference
      binding.pry
      erb :"/exercises/show.html"
    else
      redirect "/workouts"
    end
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
