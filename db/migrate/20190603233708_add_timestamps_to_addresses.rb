class AddTimestampsToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_timestamps(:addresses, null: false)
  end
end
