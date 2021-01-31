class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.text :description
      t.references :tcategory, foreign_key: true
      t.string :certificate

      t.timestamps
    end
  end
end
