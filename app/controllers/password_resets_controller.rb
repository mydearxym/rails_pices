
class PasswordResetsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]
  before_filter :require_no_user

  def new 
    @emptyone = Emptyone.new
  end 

  def update
    #debugger
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save 
      # flash[:notice] = "密码修改成功。"
      flash[:notice] = "password save ok"
      redirect_to root_url
    else 
      render 'edit'
    end 
  end 

  def create 
    
    # @user = User.find_by_email(params[:email])
    @user = User.find_by_email(params[:emptyone][:email])
    if @user 
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      # flash[:notice] = "重设密码的链接已经发送到您的邮箱，请查收"
      
      redirect_to root_url
    else 
      # flash[:notice] = "该邮箱没有注册"
      flash[:notice] = "this email is not registed"
      render 'new'
    end 
  end 

  private 
  def load_user_using_perishable_token
    #debugger
    @user = User.find_by_perishable_token(params[:id])
    # pry
    unless @user
      #debugger
      flash[:notice] = "fail no account somehow"
      redirect_to root_url
    end 
  end 
end

