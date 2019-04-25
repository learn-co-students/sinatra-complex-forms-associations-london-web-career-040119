#This controller has a set of routes that enable the basic CRUD actions (except for delete –– we don't really care about deleting for the purposes of this exercise).

class OwnersController < ApplicationController # inherits all from the class method ApplicationController in application_controller.rb

  # GET is used to retrieve and list information, like getting a menu, getting a drink, or getting a coat check number.
  # POST is used to create new entry in the application database, like adding to a bar’s inventory, or checking your coat.


#INDEX - this will give us list of owners

  get '/owners' do # get is a method that is already defined with in sinartra / this is followed by the path we want here we want to go to owners
    @owners = Owner.all # the instance variable owners is set = to the Owers class .all - to collect all instances from the Owner class
    erb :'/owners/index' # erb = is enbeded ruby / this method will return a string / also takes the path of owners from views and then the index.erb file from there
# when using sinatra and trying to locate an erb folder it will directly go to the erb folder - hench why we dont mention it in the path even tho owners is within the views folder
end # the get method always follows the layout of get '/' do ... end

#NEW - this will show a new owners form

  get '/owners/new' do
    @pets = Pet.all
    erb :'/owners/new'
  end

#CREATE - create a new owner, then redirect somewhere

  post '/owners' do # post is another class method that is defined within the sinartra scope / here this post method will be used to create a new entry for owners

    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
      # When using the shovel operator, ActiveRecord instantly fires update SQL
      # without waiting for the save or update call on the parent object,
      # unless the parent object is a new record.
    end
    redirect "owners/#{@owner.id}"

  end

  #EDIT - Show edit form for one owner

  get '/owners/:id/edit' do  # here this path will got to owners id elemetn in the edit.erb file from views - :id used : since it is an attribute of an owner
    @owner = Owner.find(params[:id]) # here we set the instance variable owners equal to = (here we look in the Owers class and use the find method to )
# params[:id] - where :id is the key of a key/value pair - params[:id] will grab the value to :id from the url

    @pets = Pet.all

    erb :'/owners/edit' # again when looking for erb file sinatra knows to go stright to our view folder where we find the owners folder with the edit.erb file inside
  end

#SHOW - Show info about one specific owner

  get '/owners/:id' do
    @owner = Owner.find(params[:id]) # will set the instance variable ower to the value of the key :id from the url
    erb :'/owners/show' # again grabbing the show.erb from views file
  end



# UPDATE - update a particular owner, then redirect somewher

# when updating the verb can be put or patch they both do pretty much the same thing - the verb is there just to indicate what we are doing - patch is more likely to be used if data already exists
  patch '/owners/:id' do  # patch is another method within sinatra but we could of also used "put" here - but best to sitch with one or the other

    @owner = Owner.find(params[:id])

 ####### the following bug fix is required so that it's possible to remove ALL previous pets from owner.
    if !params[:owner].keys.include?("pet_ids")
        params[:owner]["pet_ids"] = []
    end
 ####### End of fix

    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
       @owner.pets << Pet.create(name: params["pet"]["name"])
     end
      redirect "owners/#{@owner.id}"
    end

  end
