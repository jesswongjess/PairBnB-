class ChangePasswordRequiredForUsers < ActiveRecord::Migration[5.0]
# so fb login does not enceypted password
  def change
    change_column_null :users, :encrypted_password, true
  end
end
