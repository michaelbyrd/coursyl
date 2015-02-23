class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.integer :course_id
      t.string :name
      t.integer :order_number
      t.text :description

      t.timestamps
    end
  end
end
