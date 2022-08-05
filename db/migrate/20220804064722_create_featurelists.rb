class CreateFeaturelists < ActiveRecord::Migration[6.1]
  def change
    create_table :featurelists do |t|
      t.string :type
      t.integer :product_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
