class CreateDiaries < ActiveRecord::Migration[6.1]
  def change
    create_table :diaries do |t|
      t.string :title
      t.datetime :expiration
      t.integer :kind

      t.timestamps
    end
  end
end
