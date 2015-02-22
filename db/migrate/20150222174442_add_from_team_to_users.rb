class AddFromTeamToUsers < ActiveRecord::Migration
  def change
    add_column :users, :from_team, :boolean, default: false
  end
end
