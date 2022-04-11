class CreateTableTweets < ActiveRecord::Migration[7.0]
  def up
    create_table :tweets do |t|
      t.string :autor_id, null: false
      t.text :text
      t.string :topic
      t.text :attachments
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end

  def down
    drop_table  :tweets
  end
end
