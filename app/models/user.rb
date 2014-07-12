class User < ActiveRecord::Base

  acts_as_authentic do |c|
#     #c.login_field = 'login'
#     #c.validate_email_field = false 
#     #c.validate_password_field = false
  end 

  # ROLES = %w[admin moderator author banned]

#   @@need_email_confirm = false 

  attr_accessible :login, :password, :password_confirmation, :email
  attr_accessible :qq_uid, :qq_access_token, :sina_uid, :sina_access_token
  attr_accessible :roles

#   has_many :articles

#   #validates :password, :presence => { :if => :password_required? }, :confirmation => true

  # def roles=(roles)
  #   self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  # end 

  # def roles 
  #   ROLES.reject do |r| ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
  #   end 
  # end 

  # def role?(role)
  # 	roles.include? role.to_s
  # end

#   def is?(role)
#     roles.include?(role.to_s)
#   end 

#   def self.need_email_confirm 
#     @@need_email_confirm
#   end 

#   def self.find_by_login_or_email(login)
#     find_by_login(login) || find_by_email(login)
#   end 

#   def self.def_create_user_from_login_third(name)
#     define_singleton_method("create_user_from_#{name}") do |login_hash|
#       #debugger
#       self.create({
#         "#{login_hash['provider']}_uid" => login_hash['uid'],
#         "#{login_hash['provider']}_access_token" => login_hash['access_token']
#       } )
#     end 
#   end 

#   def_create_user_from_login_third :qq
#   def_create_user_from_login_third :sina

#   def self.find_or_create_from_login_third(login_hash)
#     provider      = login_hash['provider']
#     uid           = login_hash['uid']
#     access_token  = login_hash['access_token']

#     #debugger
#     if user = self.send("find_by_#{provider}_uid", uid)
#       return user 
#     else 
#       return self.send("create_user_from_#{provider}", login_hash)
#     end 
#   end 

#   def deliver_password_reset_instructions!
#     reset_perishable_token!
#     Notifier.password_reset_instructions(self).deliver
#   end 

#   def signup!
#     if @@need_email_confirm
#       save_without_session_maintenance
#     else 
#       save
#     end 
#   end 

#   def active?
#     if @@need_email_confirm
#       active
#     else 
#       true
#     end 
#   end 

#   def activate!
#     self.active = true 
#     save
#   end 

#   def reset_confirm_email_token!
#     self.confirm_email_token = Authlogic::Random.friendly_token
#     self.confirm_email_send = Time.now
#     self.confirm_email_at = ""
#     save_without_session_maintenance(:validate => false)
#   end 

#   def clear_confirm_email_token!
#     self.confirm_email_token = ""
#     self.confirm_email_send = ""
#     self.confirm_email_at = Time.now
#     save_without_session_maintenance(:validate => false)
#   end 

#   def deliver_activation_instructions!
#     reset_confirm_email_token!
#     Notifier.activation_instructions(self).deliver
#   end 

#   def deliver_activation_confirmation!
#     clear_confirm_email_token!
#     Notifier.activation_confirmation(self).deliver
#   end 

end
