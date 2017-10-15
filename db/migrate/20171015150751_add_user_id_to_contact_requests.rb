class AddUserIdToContactRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :contact_requests, :user, foreign_key: true
  end
end
