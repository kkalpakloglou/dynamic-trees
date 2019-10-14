class CreateDynamicTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :dynamic_trees do |t|
      t.integer :parent_id, index: true
      t.ltree :materialized_path

      t.timestamps
    end

    add_index :dynamic_trees, :materialized_path, using: :gist
  end
end
