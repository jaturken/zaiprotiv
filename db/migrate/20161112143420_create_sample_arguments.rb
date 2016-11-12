class CreateSampleArguments < ActiveRecord::Migration[5.0]
  def change
    create_table :sample_arguments do |t|
      t.integer :sample_id
      t.integer :argument_id

      t.timestamps
    end
  end
end
