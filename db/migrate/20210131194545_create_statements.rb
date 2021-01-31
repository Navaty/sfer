class CreateStatements < ActiveRecord::Migration[5.1]
  def change
    create_table :statements do |t|
      t.string :name, null: false
      t.string :soname, null: false
      t.string :father_name, null: false
      t.string :email, null: false
      t.string :position, null: false
      t.string :place, null: false
      t.references :test, foreign_key: true
      t.boolean :notified, default: false, null: false
      t.boolean :paid, default: false, null: false
      t.string :certificate

      t.timestamps
    end
  end
end
