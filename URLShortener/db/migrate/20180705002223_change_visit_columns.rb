class ChangeVisitColumns < ActiveRecord::Migration[5.1]
  def change
    rename_column :visits, :user, :user_id
    rename_column :visits, :short_url, :short_url_id
  end
end
