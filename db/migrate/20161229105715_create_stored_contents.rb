class CreateStoredContents < ActiveRecord::Migration
  def change
    create_table :stored_contents do |t|
      t.text :source
      t.text :content
      t.string :tag
      t.json :html_attrs

      t.timestamps null: false
    end
  end
end
