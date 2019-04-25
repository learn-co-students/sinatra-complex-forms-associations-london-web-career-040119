#This controller has a set of routes that enable the basic CRUD actions (except for delete –– we don't really care about deleting for the purposes of this exercise).

 # this follows same comments from owners_controllee

class PetsController < ApplicationController

#INDEX

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  #NEW

  get '/pets/new' do
    erb :'/pets/new'
  end

#CREATE - create and redirect

  post '/pets' do

        @pet = Pet.create(params[:pet])
      if !params["owner"]["name"].empty?
        @pet.owner = Owner.create(name: params["owner"]["name"])
      end
        @pet.save

    redirect to "pets/#{@pet.id}" # using the redirect method from sinarta
  end

#SHOW

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end
    @pet.save
    redirect "pets/#{@pet.id}"
  end



#EDIT

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

end
