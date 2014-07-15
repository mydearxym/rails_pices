class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  helper_method :current_user_session, :current_user, :role_is?

  private

  def current_user_session  
    @current_user_session ||= UserSession.find  
  end  
  
  def current_user
    # @current_user ||= current_user_session && current_user_session.record  
    @current_user ||= current_user_session && current_user_session.user
  end  

  def role_is?(role_given)
    if current_user
      current_user.roles.include? role_given
    else
      false
    end
  end


  def require_user(format = nil)
    unless current_user 
      respond_to do |format|
        format.html do 
          store_location 
          flash[:notice] = "You must be logged in to access this page"
          redirect_to new_user_session_url
        end 
        format.json do 
          render :json => {'errors' => 'You must be logged in to access this endpoint'}
        end 
      end 
      return false
    end 
  end 

  def require_no_user 
    if current_user 
      respond_to do |format|
        format.html do 
          store_location 
          flash[:notice] = "You must be logged out to access this page"
          redirect_to account_url
        end 
        format.json do 
          render :json => '"You must be logged out to access this endpoint"', :status => 403
        end 
      end
      return false
    end 
  end 




end
