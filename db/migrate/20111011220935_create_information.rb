class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.references :user
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :twitter
      t.string :facebook
      t.string :orkut
      t.string :linkedin

      t.timestamps
    end
  end
end
