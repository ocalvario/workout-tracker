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
      if params.any? {|k, v| v.empty?}
         redirect "/workouts/new.html"
      else @workout = Workout.create(
        name: params[:name], 
        date: params[:date]
        )
        current_user.workouts << @workout
       redirect "/workouts/#{@workout.id}" 
      end
    end

  #read
  
    get "/workouts" do
      @user = current_user
      @workouts = current_user.workouts
      erb :"/workouts/index.html"
    end
    
    get "/workouts/:id" do
      @workout = Workout.find(params[:id])
      if current_user == @workout.user
        erb :"/workouts/show.html"
      else
        redirect "/workouts"
      end
    end  
  
  #update
    
    get "/workouts/:id/edit" do
      @workout = Workout.find(params[:id])  
      if current_user == @workout.user
        erb :"/workouts/edit.html"
      else
        redirect "/workouts"
      end
    end
    
    patch "/workouts/:id" do
      @workout = Workout.find(params[:id])
      if params.any? {|k, v| v.empty?}
        redirect "/workouts/#{@workout.id}/edit"
      else
        @workout.update(
          name: params[:name], 
          date: params[:date]
          )
        redirect "/workouts/#{@workout.id}"
      end
    end
  
  #delete
  
    delete "/workouts/:id/delete" do
      @workout = Workout.find(params[:id])
      if current_user == @workout.user
        @workout.destroy
        redirect "/workouts"
      else
        redirect "/workouts"
      end
    end
    
    post  "/workouts/:id/delete" do
      redirect "/workouts"
    end
end
