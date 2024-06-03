class CreateApiRequestLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :api_request_logs do |t|
      t.string :method
      t.string :path
      t.integer :status
      t.float :duration
      t.string :ip
      t.text :params

      t.timestamps
    end
  end
end
