class CreateTableTweets < ActiveRecord::Migration[7.0]
  def up
    create_table :tweets do |t|
      t.string :author_id, null: false
      t.text :text
      t.string  :lang
      t.integer :topic_id
      t.text :attachments
      t.string :conversation_id
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    create_table :topics do |t|
      t.text :name
      t.timestamp :created_at
      t.timestamp :updated_at
    end


  end

  def down
    drop_table  :tweets
  end
end
