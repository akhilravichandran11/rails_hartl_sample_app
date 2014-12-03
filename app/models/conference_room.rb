class ConferenceRoom < ActiveRecord::Base
  has_many :bookings
  default_scope -> { order(created_at: :desc) }
  
   validates(:name,  presence: true , length: { minimum:2 , maximum: 50 } )
   validates(:floor,  presence: true )
   validates(:buildingName,  presence: true , length: { minimum:1 , maximum: 50 } )
   validates(:city,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:state,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:country,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:type,  presence: true , length: { minimum:3 , maximum: 50 } )
   validates(:capacity,  presence: true )
   
 
end
