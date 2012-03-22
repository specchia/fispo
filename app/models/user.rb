class User < ActiveRecord::Base
  has_one :account
#  set_table :users
 # establish_connection :database => "old_database", :user => "old user", :adapter => "mysql"

belongs_to :account

end
