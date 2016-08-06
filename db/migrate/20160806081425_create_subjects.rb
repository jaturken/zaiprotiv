class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects, options: 'DEFAULT CHARSET=utf8mb4' do |t|
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
