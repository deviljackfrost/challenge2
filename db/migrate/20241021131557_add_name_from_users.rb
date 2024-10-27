class AddNameFromUsers < ActiveRecord::Migration[6.1]
  def change
     change_table :users do |t|
      t.string :name unless t.column_exists?(:name)
  end
end
end