class CreateValids < ActiveRecord::Migration
  def change
    create_table :valids do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
