require 'rspec'
require 'family_tree'

describe PolyTreeNode do
  let(:Nancy) { PolyTreeNode.new('Nancy') }
  let(:Jill) { PolyTreeNode.new('Jill') }
  let(:Adam) { PolyTreeNode.new('Adam') }
  let(:Carl) { PolyTreeNode.new('Carl') }
  let(:Kevin) { PolyTreeNode.new('Kevin') }
  let(:Catherine) { PolyTreeNode.new('Catherine') }
  let(:Joseph) { PolyTreeNode.new('Joseph') }
  let(:George) { PolyTreeNode.new('George') }
  let(:Samuel) { PolyTreeNode.new('Samuel') }
  let(:James) { PolyTreeNode.new('James') }
  let(:Aaron) { PolyTreeNode.new('Aaron') }
  let(:Mary) { PolyTreeNode.new('Mary') }
  let(:Robert) { PolyTreeNode.new('Robert') }
  let(:Patrick) { PolyTreeNode.new('Patrick') }

  Nancy.add_child(Adam)
  Nancy.add_child(Jill)
  Nancy.add_child(Carl)
  Jill.add_child(Kevin)
  Carl.add_child(Catherine)
  Carl.add_child(Joseph)
  Kevin.add_child(Samuel)
  Kevin.add_child(George)
  Kevin.add_child(James)
  Kevin.add_child(Aaron)
  George.add_child(Patrick)
  George.add_child(Robert)
  James.add_child(Mary)

  describe "grandparent" do
    it "should identify James' grandparent" do
      expect(James.grandparent).to eq('Jill')
    end

    it "should identify Mary's grandparent" do
      expect(Mary.grandparent).to eq('Kevin')
    end

    it "should identify Catherine's grandparent" do
      expect(Catherine.grandparent).to eq('Nancy')
    end
  end
end
