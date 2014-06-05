class CreateRingtones < ActiveRecord::Migration
  def change
    create_table :ringtones do |t|
      t.string :name
      t.string :tag
      
      t.timestamps
    end
  end

  

end
