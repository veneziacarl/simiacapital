class AddColumnUsersDailyNews < ActiveRecord::Migration
  def change
    add_column :users, :daily_news, :boolean, default: false, null: false
  end
end
