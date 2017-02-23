class CreateTextStrings < ActiveRecord::Migration
  def change
    create_table :text_strings do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
