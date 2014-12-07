class Confroombooking < ActiveRecord::Base
  belongs_to :users
  belongs_to :rooms
  
  ##validates_associated :users
  ##validates_associated :rooms
  
 
  validate:booking_date_cannot_be_in_the_past
  validate:booking_starttime_cannot_be_in_the_past
  validate:booking_endtime_cannot_be_in_the_past
  validate:booking_endtime_cannot_be_lesser_than_starttime
  validate:booking_slot
  validate:booking_date_cannot_be_weekend
  validate:booking_date_cannot_be_on_a_holiday
  
 validates(:roomstatusreason , length: { minimum:3 , maximum: 50 } )
 
 
   def booking_slot
     
       if !User.exists?(id:[ user_id])
         errors[:base] << "User With Id = "+room_id.to_s+" Does Not Exist"
       elsif !Room.exists?(id:[ room_id])
         errors[:base] << "Room With Id = "+room_id.to_s+" Does Not Exist"
       elsif User.exists?(id:[ user_id]) and Room.exists?(id:[ room_id])
       
       ##errors[:base] << "User And Room Does  Exist"
      
       
      ## @reserved=Confroombooking.where("room_id = ? AND bday= ? AND bmonth= ? AND byear = ? and roomstatus = ? ",room_id,bday,bmonth,byear,true)
       
       
        if(roomstatusreason=="Edit")
        ## @reserved.delete(:id => id)
         @reserved=Confroombooking.where("id != ? AND room_id = ? AND bday= ? AND bmonth= ? AND byear = ? and roomstatus = ? ",id,room_id,bday,bmonth,byear,true)
         elsif
         @reserved=Confroombooking.where("room_id = ? AND bday= ? AND bmonth= ? AND byear = ? and roomstatus = ? ",room_id,bday,bmonth,byear,true)
         end
       
       @reserved.all.each do |resv|
      
         
         @rsthour=resv[:stHour]
         @rstmin=resv[:stMin]
         @bookedstarttime=Time.parse(@rsthour.to_s+":"+@rstmin.to_s)
         @renhour=resv[:enHour]
         @renmin=resv[:enMin]
         @bookedendtime=Time.parse(@renhour.to_s+":"+@renmin.to_s)
         
         @currentstarttime=Time.parse(stHour.to_s+":"+stMin.to_s)
         @currentendtime=Time.parse(enHour.to_s+":"+enMin.to_s)
         
         ##errors[:base] << " Booked Start Time "+ @rsthour.to_s+" "+@rstmin.to_s+" "+ @bookedstarttime.to_s
         ##errors[:base] << " Booked End Time "+ @renhour.to_s+" "+@renmin.to_s+" "+ @bookedendtime.to_s
         ##errors[:base] << " Current Start Time "+ @currentstarttime.to_s
         ##errors[:base] << " Current End Time "+ @currentendtime.to_s
  
         
         if @currentstarttime>=@bookedstarttime and  @currentstarttime<=@bookedendtime
         errors[:base] << "Start Time Is Occupied By User With Id = "+resv[:user_id].to_s+" And Name = "+User.find_by(:id => resv[:user_id].to_i)[:name].to_s+" Along With Booking Id = "+resv[:id].to_s+" And In Time Slot "+@bookedstarttime.to_s(:time)+" - "+@bookedendtime.to_s(:time)
         elsif @currentendtime>=@bookedstarttime and  @currentendtime<=@bookedendtime
         errors[:base] << "End Time Is Occupied By User With Id = "+resv[:user_id].to_s+" And Name = "+User.find_by(:id => resv[:user_id].to_i)[:name].to_s+" Along With Booking Id = "+resv[:id].to_s+" And In Time Slot "+@bookedstarttime.to_s(:time)+" - "+@bookedendtime.to_s(:time)
         end
         
         
         
       end
       
       end
    
  end
 
  def booking_date_cannot_be_in_the_past
    if !bdate.blank? and bdate < Date.today
      errors[:base]<<  "Booking Date Can't Be In The Past"
    end
  end
  
    def booking_date_cannot_be_weekend
    if !bdate.blank? and bdate.strftime("%a").to_s.include? "Sat"
      errors[:base]<< "Booking Day Can't Be Saturday"
    elsif !bdate.blank? and bdate.strftime("%a").to_s.include? "Sun"
      errors[:base]<< "Booking Day Can't Be Sunday"
    end
  end
  
  def booking_date_cannot_be_on_a_holiday
    
    @cholidays=Holiday.all
    @cholidays.all.each do |choliday|
      
      if choliday[:hdate]==bdate
        errors[:base]<< "Booking Day Is A Holiday | Holiday Name = "+choliday[:hname]
      end
    end
  end
  
    def booking_starttime_cannot_be_in_the_past
      @ctimehour=Time.now.to_s(:time).split(':')[0].to_i
      @ctimemin=Time.now.to_s(:time).split(':')[1].to_i
      
    if  !stHour.blank? and !stMin.blank? and bdate == Date.today  and  @ctimehour==stHour and @ctimemin>stMin
      errors[:base]<<  "Booking Start Time(Minutes) Can't Be In The Past"
    elsif  !stHour.blank? and  bdate == Date.today  and  @ctimehour>stHour
      errors[:base]<<  "Booking Start Time(Hour) Can't Be In The Past"
    end
  end
  
    def booking_endtime_cannot_be_in_the_past
      @ctimehour=Time.now.to_s(:time).split(':')[0].to_i
      @ctimemin=Time.now.to_s(:time).split(':')[1].to_i
      
    if  !enHour.blank? and !enMin.blank? and bdate == Date.today  and  @ctimehour==enHour and @ctimemin>enMin
      errors[:base]<<  "Booking End Time(Minutes) Can't Be In The Past"
    elsif  !enHour.blank? and  bdate == Date.today  and  @ctimehour>enHour
      errors[:base]<<  "Booking End Time(Hour) Can't Be In The Past"
    end
  end
  
  
    def booking_endtime_cannot_be_lesser_than_starttime
    
    if !stHour.blank? and !stMin.blank? and !enHour.blank? and !enMin.blank? and bdate >= Date.today  and enHour==stHour and stMin>=enMin
      errors[:base]<<  "Booking End Time(Minutes) Can't Be Lesser Than Start Time"
    elsif  !stHour.blank? and !enHour.blank? and bdate >= Date.today and stHour>enHour
      errors[:base]<<  "Booking End Time(Hour) Can't Be Lesser Than Start Time"
    end
  end
  
 
 ##validates(:enMin , greater_than:stMin  )

end
