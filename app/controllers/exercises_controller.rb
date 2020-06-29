class ExercisEsController < ApplicationController

  # GET: /exercis_es
  get "/exercis_es" do
    erb :"/exercis_es/index.html"
  end

  # GET: /exercis_es/new
  get "/exercis_es/new" do
    erb :"/exercis_es/new.html"
  end

  # POST: /exercis_es
  post "/exercis_es" do
    redirect "/exercis_es"
  end

  # GET: /exercis_es/5
  get "/exercis_es/:id" do
    erb :"/exercis_es/show.html"
  end

  # GET: /exercis_es/5/edit
  get "/exercis_es/:id/edit" do
    erb :"/exercis_es/edit.html"
  end

  # PATCH: /exercis_es/5
  patch "/exercis_es/:id" do
    redirect "/exercis_es/:id"
  end

  # DELETE: /exercis_es/5/delete
  delete "/exercis_es/:id/delete" do
    redirect "/exercis_es"
  end
end
