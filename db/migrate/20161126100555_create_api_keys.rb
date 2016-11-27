class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.string :access_token, null:false
      t.references :user, index: true, foreign_key: true
      t.integer :status, null:false ,default: 1
      t.timestamps null: false

      t.index :access_token, unique: true
      t.index :status

    end
  end
end
