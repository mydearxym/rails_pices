class UsersController < ApplicationController
  # before_filter :require_no_user, :only => [:new, :create]
  # before_filter :require_user, :only => [:show, :edit, :update]
  def new
    @user = User.new
  end

  def create   
    @user = User.new params[:user]  
    # pry.binding
    if @user.save
      flash[:notice] = 'Register create successful !'
      redirect_to root_path
    else  
      render 'new'  
    end
  end  

  # def create
  #   #debugger
  #   @user = User.new(params[:user])
  #   #if @user.save
  #     #flash[:notice] = "Account registered"
  #     #Notifier.welcome_email(@user).deliver

  #     #redirect_back_or_default  account_url
  #   #else
  #     #render 'new'
  #   #end

  #   if @user.signup!
  #     @user.deliver_activation_instructions!
  #     flash[:notice] = "Your account has been created, please check you e-mail"
  #     redirect_to root_url
  #   else 
  #     render 'new'
  #   end 
  # end

  def show 
    # @user = @current_user
    @user = current_user

    respond_to do |format|
      format.html 
      format.json { hello "this is json from rails!"}
    end

  end 

  def edit 
    @user = current_user 
  end 

  def update 
    # pry
    @user = current_user 
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account update"
      redirect_to account_url
    else 
      render 'edit'
    end 
  end 

end
