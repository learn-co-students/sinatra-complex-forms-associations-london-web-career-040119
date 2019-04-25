# A symbol specifying the deployment environment; typically set to one of :development, :test,
#  or :production. The :environment defaults to the value of the APP_ENV environment variable
#  (ENV['APP_ENV']), or :development when no APP_ENV environment variable is set.


ENV['SINATRA_ENV'] ||= "development" #EVN is in regards to the deloyed enviroment  / typically set to = development
#this also uses the ||= which means if ENV['SINATRA_ENV'] exits then its equal to its self but if it doesnt then its equal to "development"

require 'bundler/setup' # by requiring bundle/setup this ensures you're loading Gemfile defined in gems
Bundler.require(:default, ENV['SINATRA_ENV']) #requires all the gems in the Gemfile

ActiveRecord::Base.establish_connection(   #Establishes the connection to the database.
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'  # this will require all file that we have in our app folder 
