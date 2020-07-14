class WorkoutsController < ApplicationController

  #create
    
    get "/workouts/new.html" do
      if logged_in?
        erb :"/workouts/new.html"
      else
        flash[:alert] = "Please login first"
        redirect "/login"
      end
    end 
    
    post "/workouts" do
      if params.any? {|k, v| v.empty?}
         flash[:alert] = "Please enter all required fields"
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
       if logged_in?
        @workouts = current_user.workouts
        erb :"/workouts/index.html"
      else
        flash[:alert] = "Please login first"
        redirect "/login"
      end
    end
    
    get "/workouts/:id" do
      if logged_in?
        @workout = Workout.find(params[:id])
          if current_user == @workout.user
            erb :"/workouts/show.html"
          else
            flash[:alert] = "Access denied"
            redirect "/workouts"
          end
      else
        flash[:alert] = "Please login first"
        redirect "/login"
      end
    end  
  
  #update
    
    get "/workouts/:id/edit" do
      if logged_in?
        @workout = Workout.find(params[:id])  
        if current_user == @workout.user
          erb :"/workouts/edit.html"
        else
          flash[:alert] = "Access denied"
          redirect "/workouts"
        end
      else
        flash[:alert] = "Please login first"
        redirect "/login" 
      end 
    end
    
    patch "/workouts/:id" do
      @workout = Workout.find(params[:id])
      if params.any? {|k, v| v.empty?}
        flash[:alert] = "Please enter all required fields"
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
        @workout.destroy
        redirect "/workouts"
    end
    
end
