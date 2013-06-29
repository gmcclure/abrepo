class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :code
      t.string :password

      t.timestamps
    end
  end
end
