class ChangeCollationFromMembers < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE members CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
    SQL
  end

  def down

  end
end
