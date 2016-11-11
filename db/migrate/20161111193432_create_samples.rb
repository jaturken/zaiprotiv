class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
