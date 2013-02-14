class ValidsController < ApplicationController
  
   
  def index
    @valids = Valid.order("created_at ASC")
  end

  def create
   	@valid = Valid.new(params[:valid])
    if @valid.save
      flash[:notice] = "NEW USER CREATED"
      redirect_to valids_url
    else
      flash[:notice] = "YOU MUST ENTER THE VALUE !!!"
      redirect_to new_session_url
    end   
  end
  
  def destroy
     @valid = Valid.find(params[:id])
     @valid.destroy
     redirect_to valids_url
  end
end

#===============================================================================

    

  # def logged_in?
  #   session[:user_id].present?
  # end
  
  # def current_user
  #   @current_user ||= User.find(session[:user_id])
  # end
  
  # def require_user
  #   unless current_user
  #     store_location
  #     flash[:notice] = "You must be logged in to view this page"
  #     redirect_to new_session_url
  #     return false
  #   end
  # end
  
  # def store_location
  #   session[:return_to] = request.request_uri
  # end
 
  # def redirect_back_or_default(default)
  #   redirect_to(session[:return_to] || default)
  #   session[:return_to] = nil
  # end

