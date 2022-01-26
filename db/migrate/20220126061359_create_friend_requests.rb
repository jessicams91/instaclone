class CreateFriendRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :friend_requests do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :friend, null: false, foreign_key: {to_table: :users}
      t.integer :status

      t.timestamps
    end
  end
end
