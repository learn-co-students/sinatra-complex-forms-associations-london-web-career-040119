class CreateOwnersTable < ActiveRecord::Migration #inherits from active record of the subclass Migration
  #migration add a table below called change with  string for a column named "name"
  #A primary key column called id will also be added implicitly, as it's the default primary key for all Active Record models. 
  def change
    create_table :owners do |t|
      t.string :name
    end
  end
end
