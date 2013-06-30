class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :citation
      t.text :annotation
      t.belongs_to :bibliography, index: true

      t.timestamps
    end
  end
end
