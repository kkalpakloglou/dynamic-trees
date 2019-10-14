# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

root_one = DynamicTree.create
root_two = DynamicTree.create
  
DynamicTree.roots.each do |root|
  1.upto(5) do
    level2 = DynamicTree.create(parent_id: root.id)
    1.upto(rand(0..10)) do
      level3 = DynamicTree.create(parent_id: level2.id)

      1.upto(rand(0..5)) do
        level4 = DynamicTree.create(parent_id: level3.id)
        
        1.upto(rand(0..6)) do
          DynamicTree.create(parent_id: level4.id)
        end
      end 
    end 
  end
end