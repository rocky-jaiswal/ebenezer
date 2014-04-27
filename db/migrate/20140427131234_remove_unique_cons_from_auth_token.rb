class RemoveUniqueConsFromAuthToken < ActiveRecord::Migration
  def change
    remove_index :users, column: :authentication_token
  end
end