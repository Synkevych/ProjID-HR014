class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.text :comment
      t.integer :audit_id

      t.timestamps
    end
  end
end
