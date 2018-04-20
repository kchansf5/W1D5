require 'byebug'

class PolyTreeNode
  attr_reader :parent, :value
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

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      result_node = child.dfs(target_value)
      return result_node if result_node.is_a?(PolyTreeNode)
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      shifted_node = queue.shift
      return shifted_node if shifted_node.value == target_value
      queue.concat(shifted_node.children)
    end
  end
end
