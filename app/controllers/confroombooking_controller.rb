class ConfroombookingController < ApplicationController
  
  def new
      ## @crooms=Room.all
    ##@cuser = User.find(session[:user_id])
    ##@cmintimes=["00","05","10","15","20","25","30","35","40","45","50","55"]
    @cmintimes=[0,5,10,15,20,25,30,35,40,45,50,55]
    ##@chourtimes=["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
    @chourtimes=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
    
    @confroombooking=Confroombooking.new
  end
  
  def show
   @confroombooking = Confroombooking.find(params[:id])
    
  end

  def index
    @confroombookings=Confroombooking.all
  end

  def create
    
    iyear= params[:confroombooking]["bdate(1i)"].to_i
    ## imonth=Date::MONTHNAMES.index(params[:confroombooking]["bdate(2i)"].to_s) 
    imonth=params[:confroombooking]["bdate(2i)"].to_i
    iday= params[:confroombooking]["bdate(3i)"].to_i
    
    params[:confroombooking]["bday"]=iday
    params[:confroombooking]["bmonth"]=imonth
    params[:confroombooking]["byear"]=iyear
    params[:confroombooking]["roomstatus"]="true"
    params[:confroombooking]["roomstatusreason"]="New"
    
    
   @confroombooking=Confroombooking.new(confroombooking_params)
    if @confroombooking.save
      flash[:success] = " Created  Booking "
     redirect_to confroombooking_index_path
    else 
      flash[:danger] = " Not Created  Booking "
    ## redirect_to   new_confroombooking_path
    ##render 'confroombooking#new'
     ##redirect_to :action => :new
     render 'new'
    end

  end

  def destroy
    Confroombooking.find(params[:id]).destroy
    flash[:success] = "Booking Deleted"
    redirect_to confroombooking_index_path
  end

  def edit
   @confroombooking = Confroombooking.find(params[:id])
  end
  
  def update
  ##@user = User.find(params[:id])
  if @confroombooking.update_attributes(confroombooking_params)
    flash[:success] = "Booking Updated"
    redirect_to confroombooking_index_path
  else
      redirect_to confroombooking_index_path
   ## render 'edit'
  end
  end
  
   
  private
  
  def prepare_info
    @crooms=Room.all
    @cuser = User.find(session[:user_id])
  end
  

  def confroombooking_params
      params.require(:confroombooking).permit(:user_id, :room_id, :roomstatus, :roomstatusreason , :stHour, :stMin , :enHour , :enMin , :bday , :bmonth , :byear , :bdate)
  end
  
  def confroombooking_params2
    if params[:confroombooking].nil?  || params[:confroombooking].empty?
        return false
    else
        params.require(:confroombooking).permit(:user_id, :room_id, :roomstatus, :roomstatusreason , :stHour, :stMin , :enHour , :enMin , :bday , :bmonth , :byear , :bdate)
    end
end
  
end
