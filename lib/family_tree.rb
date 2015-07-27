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
      return nil
    end

    self.parent.parent.value
  end

  def most_grandchildren
    nodes = [self]
    grandparents = Hash.new { 0 }


    until nodes.empty?
      node = nodes.shift

      if node.grandparent != nil
        grandparents[node.grandparent] += 1
      end
      nodes.concat(node.children)
    end

    return grandparents.max_by{|k,v| v}[0]
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

  protected
  def _children
    @children
  end
end
