class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.integer :parent_lesson_id
      t.string :name
      t.datetime :held_at
      t.text :description
      t.text :outline
      t.text :lead_in_question
      t.text :video_url

      t.timestamps
    end
  end
end
