class SessionsController < ApplicationController

	def new
	end

	def create
	     
      un = params[:un]
      pass = params[:pass]

      u = Valid.where("username=? AND password=?", un, pass).first
      
      if u.present?
        session[:user_id] = u.id
        
        flash[:notice] = "SUCCESSFULLY"
        redirect_to posts_url
      else
        flash[:notice] = "INVALID LOGIN !"
        render :new
      end
	end

	def logout
		session[:user_id] = nil
		reset_session
		render :new

    flash[:notice] = "SUCCESSFULLY LOG OUT" if session[:user_id] == nil
	end

  before_filter :login_required, only: [:logout]
  def login_required

    if session[:user_id].present?
      flash[:notice] = "SOMEONE IS LOGGED"
      # redirect_to posts_path
    else
      flash[:error] = "YOU MUST BE LOGIN !"
      render :new
    end
  end

  # def logged_in?
  #   if Valid.find(session[:user_id])
  # end

  # def current_user
  #   @current_user = nil
  #   @current_user = (Valid.find(session[:user_id]) if session[:user_id])
  # end

  # before_filter :login_required

  # def login_required 
    
  #   unless (session[:user_id] == nil)

  #     flash[:notice] = "YOU MUST BE LOGGED IN TO VIEW THIS PAGE !"
  #     render :new
    
  #   end
  # end
    # if request.post?
    #   if [authentication code]
    #     if user.activated? 
    #       session[:user_id] = user.id
    #       if params[:route]
    #         redirect_to "#{params[:route]}"
    #       else
    #         redirect_to :controller => 'home'
    #       end
    #     else
    #       flash[:notice] = "Your account hasn't been activated yet.  Check your emails!"
    #     end
    #   else
    #     flash[:notice] = "Invalid email/password combination"
    #   end
    # end

  

	#========================================================================

	# def current_user
 #    	return unless session[:user_id]
 #    	@current_user ||= User.find_by_id(session[:user_id]) 
 #  	end

 #  	def authenticate
 #    	logged_in? ? true : access_denied
 #  	end

	# def logged_in?
 #    	current_user.is_a? User
 #  	end

  # def access_denied
  #  	if session[:user_id] == nil
  #      flash[:notice] = "You must log in to perform this action."
  #      redirect_to root_path
  #   else
  #       flash[:notice] = "#{session[:user_id]} logged."
  #   end

    #   		format.html do
    #     		flash[:alert] = "You must log in to peform this action."
    #     		redirect_to root_path
    #   		end

    #   		format.js do
    #     		render_to_facebox(:partial => 'sessions/login_box')
    #   		end
    # 	end
    # false
  # end
end
