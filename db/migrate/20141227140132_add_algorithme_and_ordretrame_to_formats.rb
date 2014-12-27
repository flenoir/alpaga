class AddAlgorithmeAndOrdretrameToFormats < ActiveRecord::Migration
  def change
    add_column :formats, :algorithme, :text
    add_column :formats, :ordretrame, :text
  end
end
