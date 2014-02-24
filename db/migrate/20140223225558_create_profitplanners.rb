class CreateProfitplanners < ActiveRecord::Migration
  def change
    create_table :profitplanners do |t|
    t.integer :user_id
    t.string :content
      t.timestamps
    end
  end
end
