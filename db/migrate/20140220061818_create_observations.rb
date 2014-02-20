class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      
     
    t.string :observation_type
    t.integer :year
    t.string :landparcel
    t.string :cropobserved
    t.string :severity
    t.string :growthstage
    t.string :notes
 
    
      t.timestamps
     
    end
     
      add_attachment :observations, :image
  end
end
