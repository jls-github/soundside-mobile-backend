class AddChurchIdToService < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :church_id, :integer
  end
end
