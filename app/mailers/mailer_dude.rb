
class MailerDude < ActionMailer::Base
    # default from: "ringgogo_team@163.com"
  default from: "llz@eacheen.com"

  def hello_mail(params = {})
    # mail(:to => "ringgogo_test@163.com" , :subject => "Welcom to")
    mail(:to => "mydearxym@qq.com" , :subject => "Welcom to")
    # mail( :subject => 'this is a test', :to => "mydearxym@gmail.com")
  end

  def password_reset_instructions(user)
    @user = user 
    @url = edit_password_reset_url(@user.perishable_token)
    mail(:to => user.email, :subject => "RingGoGo: reset you password")
    # mail(:to => user.email, :subject => "铃声狗狗：请重置您的密码")
  end 

  def activation_instructions(user)
    #debugger
    @user = user
    #@url = register_url(@user.perishable_token)
    @url = register_url(@user.confirm_email_token)
    # mail(:to => user.email, :subject => "铃声狗狗：激活您的账户")
    mail(:to => user.email, :subject => "RingGoGo: active you account")
  end 

  def activation_confirmation(user)
    @user = user 
    @url = root_url 
    mail(:to => user.email, :subject => "RingGoGo: your account is been actived ")
  end 




end
