class CreateChurches < ActiveRecord::Migration[6.0]
  def change
    create_table :churches do |t|
      t.string :name

      t.timestamps
    end
  end
end
