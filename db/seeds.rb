# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "#{Rails.root}/db/seeds.rb"
namespace :db do

puts 'SETTING UP DEFAULT Account LOGIN'
account = Account.create!(:username => 'spec', :email => 'spec@email.it', :password => '0', :password_confirmation => '0')
puts 'New Account created: ' << account.username
  end