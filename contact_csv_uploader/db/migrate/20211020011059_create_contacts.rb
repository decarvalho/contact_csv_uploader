class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :birthday
      t.string :phone
      t.string :address
      t.string :card_number
      t.string :franchise
      t.string :email

      t.timestamps
    end
  end
end
