
# the main application controller which the others will inherit from 

class ApplicationController < Sinatra::Base # inherit Base class for all Sinatra applications and middleware.
  register Sinatra::ActiveRecordExtension # when wanting to add an extentsion in sinatra then you should use the register method
  set :session_secret, "my_application_secret" # set is a class method defined within sinarta: the set method takes a setting name and value and creates an attribute on the application.
  set :views, Proc.new { File.join(root, "../views/") } # Proc is a class --> Proc objects are blocks of code that have been bound to a set of local variables. File.join joins the given parameters with the / character.
end # end of class method

## :: is used for inheriting sub modules from a method
