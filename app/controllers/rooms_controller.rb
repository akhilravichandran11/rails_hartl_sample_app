class RoomsController < ApplicationController
  
  def new
    @room= Room.new
  end
  
   def show
    @room = Room.find(params[:id])
  end
  
  
  def destroy
    Room.find(params[:id]).destroy
    flash[:success] = " Room Deleted"
    redirect_to rooms_path
  end
  
  def index
    @rooms = Room.all
    ##@rooms = Room.paginate(page: params[:page])
  end
  
  def create
    @room=Room.new(room_params)
    if @room.save
      flash[:success] = "Created  Room"
     redirect_to rooms_path
    else 
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
  @room = Room.find(params[:id])
  if @room.update_attributes(room_params)
    flash[:success] = "Profile updated"
   redirect_to rooms_path
  else
    render 'edit'
  end
  end
 
  private

    def room_params
      params.require(:room).permit(:roomname, :roomtype , :roomcapacity, :floor, :buildingname, :campusname, :country , :state ,:city )
    end


end
