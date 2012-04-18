
namespace :db do
    desc "Svuota la tabella role e crea lista ruoli predefiniti"
    task :importRoles => :environment do

        puts "Imports roles #{Time.now} "
        puts "Imports roles :task_name => :environment will load the Rails environment, which will allow you to access things like your ActiveRecord models or Rails config. Without that you can just run pure Ruby code."

        #print non fa add new line mentre puts lo fa
        #print("----------#{Time.now} - print attributes submit: #{attributes.inspect}")

#        existing_roles = Role.all()
#        puts "Imports roles: existing roles " + existing_roles.count().to_s
#        for old_role in existing_roles do
#            print "deleting1 " + old_role.name
#            print "deleting2 #{old_role.name}"
#            old_role.destroy  --> quando si elimina un ruolo sta tentando di eliminare gli accounts associati
#deleting1 admindeleting2 adminrake aborted!
#Mysql2::Error: Table 'fispo_dev3.accounts_roles' doesn't exist: SELECT `accounts`.* FROM `accounts` INNER JOIN `accounts_roles` ON `accounts`.`id` = `accounts_roles`.`account_id` WHERE `accounts_roles`.`role_id` = 1
#        end
#        Role.find_each do |old_role|
#            old_role.destroy
#        end


        #roles :admin, :manager, :collaboratore, :abbonato 
        Role.create!( :name => "admin", :description =>"Ha accesso a tutte le tabelle del sistema")
        puts "    ==>     Role created admin"
        Role.create!( :name => "manager", :description =>"Gestisce le sphighe e varie tabelle")
        puts "    ==>     Role created manager"
        Role.create!( :name => "collaboratore", :description =>"Autore crea modifica i suoi articoli, detto anche redattore")
        puts "    ==>     Role created collaboratore"
        Role.create!( :name => "abbonato", :description =>"Utente con regolare iscrizione")
        puts "    ==>     Role created abbonato"
        Role.create!( :name => "guest", :description =>"Utente appena registrato, o con abbonamento scaduto o non autorizzato ad accedere ai contenuti per qualsiasi ragione possibile")
        puts "    ==>     Role created guest"
    
    end
end

#require 'rake/dsl_definition'
#require 'faker'
#namespace :admin  do
#  desc "create some fake data"
#  task :fake_people => :environment do
#    print "How many fake people do you want?"
#    num_people = $stdin.gets.to_i
#    num_people.times do
#      Person.create(:first_name => Faker::Name.first_name,
#                    :last_name => Faker::Name.last_name)
#    end
#    print "#{num_people} created.\n"
#  end
#end
