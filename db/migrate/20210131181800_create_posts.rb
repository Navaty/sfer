class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.string :m_title
      t.string :m_desc
      t.string :m_keys
      t.string :image

      t.timestamps
    end
  end
end
