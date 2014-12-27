class CreateFormats < ActiveRecord::Migration
  def change
    create_table :formats do |t|
      t.string :name
      t.text :usage
      t.text :compression
      t.text :resolution

      t.timestamps
    end
  end
end
