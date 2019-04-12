class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :title, :question
    rename_column :articles, :text, :answer
  end
end
