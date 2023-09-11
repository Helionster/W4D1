class PolyTreeNode
  
    attr_reader :value, :parent, :children 
  
    def initialize(value)
      @value = value
      @parent = nil 
      @children = []
    end
  
    def parent=(parent_node)
      # debugger
      if parent != nil
         parent.children.delete(self)
      end
     
      @parent = parent_node
  
      if self.parent == nil
        @children = nil
      elsif !parent_node.children.include?(self) 
        parent.children << self
      end
    end
  
    def add_child(child)
      child.parent=(self)
    end
  
    def remove_child(child)
      if child.parent == nil
        raise 'Not a child'
      end
  
      child.parent=(nil)
    end
  
    def dfs(target_value)
      return self if self.value == target_value
  
      self.children.each do |child|
        value = child.dfs(target_value)
  
        if value != nil
          return value
        end
      end
  
      return nil
    end

  def bfs(target = nil)
    return self if self.value == target
    nodes = [self]
    until nodes.empty?
      node = nodes.shift
      return node if node.value == target
      nodes.concat(node.children) 
    end
    nil
  end
end