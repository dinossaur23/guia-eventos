class CreateUsersAndEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :access_token
      t.string :uid
      t.string :photo_url
      t.string :provider
      t.integer :phone_number
      t.string :document_numbert
      t.string :address
      t.string :number

      t.timestamps
    end

    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :name, null: false
      t.string :address
      t.string :number
      t.string :zip_code
      t.string :description
      t.string :image
      t.date :date
      t.time :initial_time
      t.time :final_time

      t.timestamp
    end
  end
end
