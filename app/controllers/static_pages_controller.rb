class StaticPagesController < ApplicationController
  
  def home
    if logged_in?
    @userid=current_user.id
    end
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
