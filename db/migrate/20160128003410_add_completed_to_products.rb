class AddCompletedToProducts < ActiveRecord::Migration
  def change
    add_column :products, :completed, :boolean, default: false
  end
end
