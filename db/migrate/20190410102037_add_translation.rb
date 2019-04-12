class AddTranslation < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :germanquestion, :string
    add_column :articles, :germananswer, :string
  end
end
