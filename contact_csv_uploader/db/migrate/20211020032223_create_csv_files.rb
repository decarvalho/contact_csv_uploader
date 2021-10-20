class CreateCsvFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_files do |t|
      t.text :log
      t.string :status

      t.timestamps
    end
  end
end
