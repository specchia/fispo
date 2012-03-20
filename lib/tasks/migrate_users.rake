task :migrate_users => :environment do
  User.find_each do |old_user|
    u = Account.new(:email => old_user.mail, :password => old_user.pwd, :password_confirmation => old_user.pwd)
    #if your using confirmation

   # u.skip_confirmation!
   # u.confirm!
    u.save!
  end
end