class AddForemState < ActiveRecord::Migration

  def change
    add_column :accounts, :forem_state, :string, :default => 'pending_review'
  end
end
