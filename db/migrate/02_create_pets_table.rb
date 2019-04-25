class CreatePetsTable < ActiveRecord::Migration #inherits from active record of the subclass Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :owner_id
    end
  end
end
