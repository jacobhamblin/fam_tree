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
      raise "grandparent unknown"
    end

    self.parent.parent.value
  end

  protected
  def _children
    @children
  end
end
