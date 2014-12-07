class HolidaysController < ApplicationController
  
  def new
    @holiday=Holiday.new
  end
  
  def create
    params[:holiday]["status"]="true"
   @holiday=Holiday.new(holiday_params)
    if @holiday.save
      flash[:success] = " Created Holiday "
     redirect_to holidays_path
    else 
     ## flash[:danger] = " Not Created Holiday "
      render :new
    end

  end
  
  
  def show
   @holiday = Holiday.find(params[:id])
  end

  def index
    @holidays=Holiday.all
  end

  def destroy
    Holiday.find(params[:id]).destroy
    flash[:success] = "Holiday Deleted"
    redirect_to holidays_path
  end

  def edit
   @holiday = Holiday.find(params[:id])
  end
  
  def update
    @holiday = Holiday.find(params[:id])
    if @holiday.update_attributes(holiday_params)
    flash[:success] = "Hoilday Updated"
    redirect_to holidays_path
  else
    ##flash[:danger] = "Hoilday Not Updated"
    render :edit
  end
  end
  
  private


  def holiday_params
      params.require(:holiday).permit(:hname, :hdate, :status)
  end

  
end
