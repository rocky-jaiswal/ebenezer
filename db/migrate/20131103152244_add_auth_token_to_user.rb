class AddAuthTokenToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.string  :authentication_token, :null => false, :default => ""
      add_index :users, :authentication_token, :unique => true
    end
  end
end
