class CreateBibliographies < ActiveRecord::Migration
  def change
    create_table :bibliographies do |t|
      t.string :title
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
