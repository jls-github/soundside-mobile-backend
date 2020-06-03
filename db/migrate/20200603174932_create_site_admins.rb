class CreateSiteAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :site_admins do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.references :church, null: false, foreign_key: true

      t.timestamps
    end
  end
end
