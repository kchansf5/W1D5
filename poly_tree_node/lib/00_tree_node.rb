require 'byebug'

class PolyTreeNode
  attr_reader :parent, :value
  # debugger
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def children
    @children
  end

  def parent=(parent_node)
    return if self.parent == parent_node

    if self.parent
      self.parent.children.delete(self)
    end

    @parent = parent_node
    self.parent.children << self unless self.parent.nil?
  end

  def add_child(child_node)
    child_node.parent=(self)
  end

  def remove_child(child_node)
    raise "This node isn't a child!" if child_node.parent.nil?
    child_node.parent=(nil)
  end

end
