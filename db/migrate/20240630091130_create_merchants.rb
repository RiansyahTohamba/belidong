class CreateMerchants < ActiveRecord::Migration[7.1]
  def change
    create_table :merchants do |t|
      t.string :owner_name
      t.string :email
      t.string :store_name
      t.text :description
      t.string :logo
      t.boolean :has_storefront

      t.timestamps
    end
  end
end
