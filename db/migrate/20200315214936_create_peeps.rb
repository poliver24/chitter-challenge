class CreatePeeps < ActiveRecord::Migration[6.0]
  def change
    create_table :peeps do |t|
      t.text :text
      t.string :user

      t.timestamps
    end
  end
end
