class PolyTreeNode
  attr_accessor :value
  attr_reader :parent

  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end

  def parent=(parent)
    return if self.parent == parent

    if self.parent
      self.parent._children.delete(self)
    end

    @parent = parent
    self.parent._children << self unless self.parent.nil?

    self
  end

  def children
    @children
  end

  def empty_nesters
    nodes = [self]
    empty_nesters = [];
    until nodes.empty?
      node = nodes.shift

      empty_nesters << node.value if node.children.length == 0
      nodes.concat(node.children)
    end

    return empty_nesters.join(', ')
  end

  def lonely_children
    nodes = [self]
    lonely_children = [];
    until nodes.empty?
      node = nodes.shift

      if node.parent
        lonely_children << node.value if node.parent.children.length == 1
      end  
      nodes.concat(node.children)
    end

    return lonely_children.join(', ')
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if child && !self.children.include?(child)
      raise "parameter node isn't a child"
    end

    child.parent = nil
  end

  def grandparent
    if self.parent == nil || self.parent.parent == nil
      raise "grandparent unknown"
    end

    self.parent.parent.value
  end

  protected
  def _children
    @children
  end
end
