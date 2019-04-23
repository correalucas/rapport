class ChangeDatabaseCollation < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      SET NAMES utf8mb4;
    SQL

    execute <<-SQL
      ALTER DATABASE rapport_development CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;
    SQL
  end
end
