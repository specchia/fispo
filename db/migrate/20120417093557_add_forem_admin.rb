class AddForemAdmin < ActiveRecord::Migration

  def change
    add_column :accounts, :forem_admin, :boolean, :default => false
  end
end
