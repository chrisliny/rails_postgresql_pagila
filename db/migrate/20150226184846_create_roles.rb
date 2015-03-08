class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :ancestry, index: true
      

      t.timestamps null: false
    end
    
    add_reference :users, :role, index: true
  end
end
