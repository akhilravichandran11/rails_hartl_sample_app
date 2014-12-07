class Holiday < ActiveRecord::Base
  
  validates_uniqueness_of( :hdate, :scope => [:hname], :case_sensitive => false )
  validate:holiday_date_cannot_be_in_the_past
  
  
   def holiday_date_cannot_be_in_the_past
    if !hdate.blank? and hdate < Date.today
      errors[:base]<<  "Holiday Date Can't Be In The Past"
    end
  end
  
end
