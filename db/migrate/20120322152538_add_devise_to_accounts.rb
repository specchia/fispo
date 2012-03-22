class AddDeviseToAccounts < ActiveRecord::Migration
  def self.up
    change_table(:accounts) do |t|

      t.string :username

      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end

    add_index :accounts, :username,               :unique => true
    #add_index :accounts, :reset_password_token, :unique => true
    # add_index :accounts, :confirmation_token,   :unique => true
    # add_index :accounts, :unlock_token,         :unique => true
    # add_index :accounts, :authentication_token, :unique => true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
