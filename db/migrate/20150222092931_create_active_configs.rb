class CreateActiveConfigs < ActiveRecord::Migration
  def change
    create_table :active_configs do |t|
      t.string :key
      t.string :value
      t.string :type

      t.timestamps null: false
    end
    add_index :active_configs, :key, unique: true
  end
end
