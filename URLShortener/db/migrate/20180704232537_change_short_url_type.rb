class ChangeShortUrlType < ActiveRecord::Migration[5.1]
  def change
    change_column :visits, :short_url, 'integer USING CAST(short_url AS integer)'
  end
end
