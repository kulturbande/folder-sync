require 'node'

describe Node do
  
  before(:each) do
    @node = Node.new('/foo')
  end
  
  it "should has a node name" do
    @node.name.should include('foo')
  end
end