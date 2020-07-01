class ExercisesController < ApplicationController

  #create
  
  get "/exercises/new" do
    if logged_in?
      erb :"/exercises/new.html"
    else
      flash[:alert] = "Please login first"
      redirect "/login"
    end 
  end

  post "/exercises" do
     @user = current_user
     id = @user.id
     if params.any? {|k, v| v.empty?}
       flash[:alert] = "Please enter all required fields"
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
    @exercise = Exercise.find(params[:id])
    if @user.id == @exercise.user_id
      erb :"/exercises/show.html"
    else
      flash[:alert] = "Access denied" 
      redirect "/workouts"
    end
  end

  #update
  
  get "/exercises/:id/edit" do
    @user = current_user
    @exercise = Exercise.find(params[:id])
    if @user.id == @exercise.user_id
      erb :"/exercises/edit.html"
    else
      flash[:alert] = "Access denied" 
      redirect "/workouts"
    end
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
