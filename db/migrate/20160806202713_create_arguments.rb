class CreateArguments < ActiveRecord::Migration[5.0]
  def change
    create_table :arguments, options: 'DEFAULT CHARSET=utf8mb4'  do |t|
      t.integer :subject_id, null: false
      t.string :title
      t.string :body
      t.integer :rank, default: 0
      t.binary :positive

      t.timestamps
    end
  end
end
