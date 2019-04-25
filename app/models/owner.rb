class Owner < ActiveRecord::Base # Class method Owner inherits Base class for all Sinatra applications and middleware.
  has_many :pets # creating the link between Owner and pets - since Owners can have many pets
end
