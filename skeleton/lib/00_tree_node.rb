class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if node != parent
      parent.children.delete(self) if parent
      @parent = node
      node.children << self if node
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    result = nil

    return self if value == target_value
    return nil if children.empty?

    children.each do |child|
      result = child.dfs(target_value)
      return result if result && result.value == target_value
    end

    result
  end

  def bfs(target_value)
    queue = []
    queue << self

    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      
      node.children.each { |child| queue << child }
    end

    nil
  end
end
