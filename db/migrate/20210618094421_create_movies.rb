class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :img
      t.string :cover
      t.integer :votes
      t.integer :unvotes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
