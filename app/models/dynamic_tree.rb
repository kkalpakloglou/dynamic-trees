class DynamicTree < ApplicationRecord
  ltree :materialized_path

  after_create :set_materialized_path

  def to_structured_tree
    {
      id: id,
      children: children.map(&:to_structured_tree)
    }
  end

  private

  def set_materialized_path
    self.update_attribute(:materialized_path, self.id) and return if parent_id.nil?

    parent_math_path = DynamicTree.unscoped { DynamicTree.find(parent_id).try(:materialized_path) }

    self.update_attribute(:materialized_path, parent_math_path.to_s << ".#{self.id}")
  end
end
