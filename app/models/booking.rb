class Booking < ActiveRecord::Base
  belongs_to :ConferenceRoom
  belongs_to :user
end
