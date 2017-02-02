class CreateContactRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_requests do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :comment
      t.timestamps
    end
    add_attachment :contact_requests, :file
  end
end
