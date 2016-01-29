class RenameCompleted < ActiveRecord::Migration
  def change
    rename_column :products, :completed, :published
  end
end
