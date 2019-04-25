#seed data/ dummy data just to use to see if our app is wokring

# Add seed data here. Seed your database with `rake db:seed`
sophie = Owner.create(name: "Sophie") # here we are creating and saving an instance of our Owner Class

#here we create and save two new instances of the pet class
Pet.create(name: "Maddy", owner: sophie)
Pet.create(name: "Nona", owner: sophie)


# when rake db:seed is run, the code in this file is actually executed, inserting the data regarding Sophie, Maddy, and Nona into our database.
