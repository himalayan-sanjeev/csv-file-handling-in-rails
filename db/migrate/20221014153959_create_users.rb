class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_city
      t.string :address_state
      t.bigint :mobile_number
      t.string :email
      t.date :date_of_birth

      t.timestamps
    end
  end
end
