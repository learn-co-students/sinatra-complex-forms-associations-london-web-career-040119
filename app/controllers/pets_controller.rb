class PetsController < ApplicationController
  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    owner = if params['owner_name'].empty?
              Owner.find(params['owner_id'])
            else
              Owner.create(name: params['owner_name'])
            end

    @pet = Pet.create(name: params['pet_name'], owner: owner)

    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    # puts params
    # binding.pry
    @pet = Pet.find(params[:id])

    owner = if params[:owner][:name].empty?
              Owner.find(params[:owner_id])
            else
              Owner.create(params[:owner])
            end

    @pet.update(name: params[:pet_name], owner: owner)

    redirect to "pets/#{@pet.id}"
  end
end
