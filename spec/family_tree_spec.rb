require 'rspec'
require 'family_tree'

describe PolyTreeNode do
  let(:nancy) { PolyTreeNode.new('Nancy') }
  let(:jill) { PolyTreeNode.new('Jill') }
  let(:adam) { PolyTreeNode.new('Adam') }
  let(:carl) { PolyTreeNode.new('Carl') }
  let(:kevin) { PolyTreeNode.new('Kevin') }
  let(:catherine) { PolyTreeNode.new('Catherine') }
  let(:joseph) { PolyTreeNode.new('Joseph') }
  let(:george) { PolyTreeNode.new('George') }
  let(:samuel) { PolyTreeNode.new('Samuel') }
  let(:james) { PolyTreeNode.new('James') }
  let(:aaron) { PolyTreeNode.new('Aaron') }
  let(:mary) { PolyTreeNode.new('Mary') }
  let(:robert) { PolyTreeNode.new('Robert') }
  let(:patrick) { PolyTreeNode.new('Patrick') }

  describe '#add_child' do
    it "should add children correctly" do
      nancy.add_child(adam)
      expect(adam.parent.value).to eq('Nancy')
    end
  end

  before do
    nancy.add_child(adam)
    nancy.add_child(jill)
    nancy.add_child(carl)
    jill.add_child(kevin)
    carl.add_child(catherine)
    carl.add_child(joseph)
    kevin.add_child(samuel)
    kevin.add_child(george)
    kevin.add_child(james)
    kevin.add_child(aaron)
    george.add_child(patrick)
    george.add_child(robert)
    james.add_child(mary)
  end

  describe "grandparent" do
    it "should identify James' grandparent" do
      expect(james.grandparent).to eq('Jill')
    end

    it "should identify Mary's grandparent" do
      expect(mary.grandparent).to eq('Kevin')
    end

    it "should identify Catherine's grandparent" do
      expect(catherine.grandparent).to eq('Nancy')
    end

    it "should identify Kevin's grandparent" do
      expect(kevin.grandparent).to eq('Nancy')
    end
  end

  describe "empty nesters" do
    it "should properly identify people without children" do
      expect(nancy.empty_nesters).to eq('Adam, Catherine, Joseph, Samuel, Aaron, Patrick, Robert, Mary')
    end
  end

  describe "lonely children" do
    it "should properly identify people without siblings" do
      expect(nancy.lonely_children).to eq('Kevin, Mary')
    end
  end

  describe "most grandchildren" do
    it "should print the name of the person with the largest number of grand children" do
      expect(nancy.most_grandchildren).to eq('Jill')
    end
  end
end
