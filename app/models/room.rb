class Room < ActiveRecord::Base
  
    default_scope -> { order(created_at: :desc) }
  
   validates(:roomname,  presence: true , length: { minimum:2 , maximum: 50 } )
   validates(:floor,  presence: true )
   validates(:buildingname,  presence: true , length: { minimum:1 , maximum: 50 } )
   validates(:campusname,  presence: true , length: { minimum:1 , maximum: 50 } )
   validates(:city,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:state,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:country,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:roomtype,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:roomcapacity,  presence: true )
   
   ##validates([:roomname, :buildingname, :campusname]  ,uniqueness: { case_sensitive: false } )
   
  validates_uniqueness_of( :roomname, :scope => [:buildingname, :campusname], :case_sensitive => false )
   
   
end
