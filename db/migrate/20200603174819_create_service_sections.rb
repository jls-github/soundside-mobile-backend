class CreateServiceSections < ActiveRecord::Migration[6.0]
  def change
    create_table :service_sections do |t|
      t.string :title
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
