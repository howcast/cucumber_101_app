class CreateTables < ActiveRecord::Migration
  def self.up
    create_table "haikus", :force => true do |t|
      t.column "line1",      :string
      t.column "line2",      :string
      t.column "line3",      :string
      t.column "created_at", :datetime
    end
  end

  def self.down
    drop_table :haikus
  end
end
