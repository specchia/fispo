require 'rake/dsl_definition'
task :migrate_users => :environment do

  User.find_each do |old_user|

    u = Account.new( :email => old_user.mail, :password => old_user.pwd, :password_confirmation => old_user.pwd, :user_id =>old_user.id.to_s)

        #TODO
        #power_user  se power_user creare uno ruolo di Amministrator

    #if your using confirmation
    #u.skip_confirmation!
    #u.save!
   end


#  User.find_each do |old_user|
#
#    u = Account.new( :email => old_user.mail, :password => old_user.pwd, :password_confirmation => old_user.pwd, :user_id =>old_user.id.to_s)
#
#      u.save!
#   end


end
