require 'rake/dsl_definition'
task :migrate_users => :environment do

  User.find_each do |old_user|

    u = Account.new( :email => old_user.mail, :password => old_user.pwd, :password_confirmation => old_user.pwd, :user_id =>old_user.id.to_s)
    #if your using confirmation
   # u.skip_confirmation!
  u.save!
   end
end