class ConferenceRoomsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :correct_user, only: [:index]
  before_action :admin_user, only: [:index, :edit, :update , :destroy]
  
  
  def new
    @conferenceroom= ConferenceRoom.new
  end
  
end
