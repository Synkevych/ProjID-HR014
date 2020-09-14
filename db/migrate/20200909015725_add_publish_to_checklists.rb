class AddPublishToChecklists < ActiveRecord::Migration[5.2]
  def change
    add_column :checklists, :public, :boolean, default: false
  end
end
