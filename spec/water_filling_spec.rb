
require('./jar.rb')

describe Jar, "Fill the jar Equally" do
   before(:each) do
    @jar1 = Jar.new(8,1)
    @jar2 = Jar.new(5,0)
    @jar3 = Jar.new(3,0)
   end
  context "Create objects of jar" do
    it "all the objects should be of Jar type" do
       expect(@jar1.class.to_s).to eq("Jar")
       expect(@jar2.class.to_s).to eq("Jar")
       expect(@jar3.class.to_s).to eq("Jar")
    end
  end
  context "jar 1 should be filled" do
    it "should be filled with 1's" do
        expect(@jar1.jar.count(1)).to eq(@jar1.jar.size) 
    end
  end
  context "jar 2 and jar 3 should be filled with 0's" do 
    it "should be filled with 0's " do
       expect(@jar2.jar.count(0)).to eq(@jar2.jar.size)
       expect(@jar3.jar.count(0)).to eq(@jar3.jar.size) 
    end
  end
  context "get count should return the count of 1's in the jar" do 
     it "should return the count of 1's in the jar" do
        expect(@jar1.get_count).to eq(@jar1.jar.count(1))
        expect(@jar2.get_count).to eq(@jar2.jar.count(1))
     end
  end
  context "get size should return the size of the jar" do
    it "should return the size of the jar" do 
       expect(@jar1.get_size).to eq(@jar1.jar.size)
       expect(@jar2.get_size).to eq(@jar2.jar.size)
       expect(@jar3.get_size).to eq(@jar3.jar.size)
    end
  end
  context "fill should fill the 1's from one to another" do
    it "should fill the 1's from one to another"do
      #expect(Jar.fill(@jar1, @jar2)).to eq([@jar1.jar, @jar2.jar])
      expect(Jar.fill(@jar1, @jar2)).to eq([[1,1,1,0,0,0,0,0], [1,1,1,1,1]])
    end
  end
  describe Client, "should do prioritization of jars" do
   
    context "queue the jars" do 
      it "should prioritize the jars to be filled " do
        expect(Client.queue_jars(@jar1, @jar2, @jar3)).to eq([[1,1,1,0,0,0,0,0], [1,1,1,1,1]])
      end
    end
  end
end













