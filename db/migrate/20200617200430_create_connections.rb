class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.string :name
      t.string :email
      t.string :comment
      t.boolean :learn_about_jesus
      t.boolean :hear_about_church
      t.boolean :talk_to_pastor

      t.timestamps
    end
  end
end
