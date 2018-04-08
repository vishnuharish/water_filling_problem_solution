class WaterFilling
attr_accessor :j1,:j2,:j3
   def initialize()
      self.j1 = []
      self.j2 = []
      self.j3 = []
   end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
# water distribution
	def fill(from, to)
	   to.each_with_index do |val, i|
	    if to.count(1) == to.size 
	       break
	    elsif from[i].nil? || from.index(1).nil?
	       break   
	    else
	      from[from.index(1)] = 0
	      to[to.index(0)] = 1
	    end
	   end 
	   from.sort!.reverse!
	end

# Assigning pair of jars to fill  
  def queue_jars(j1,j2,j3)
     if (j1.count(1) == j1.size || j1.count(1) > j2.size) && (j2.count(1) == 0)
        puts "j1 -> j2"
        fill(j1,j2)
     elsif ((j3.count(1) < j3.size) && (j2.count(1) !=0)) || ((j2.count(1) == j2.size ) && (j3.count(1) == 0))
        puts "j2 -> j3"
        fill(j2,j3)   
     else
         puts "j3 -> j1"
        fill(j3,j1)               
     end
  end
  
  
end  


    @wf = WaterFilling.new
    puts "enter the filled jars with ',' seperated 1s"
    @wf.j1 = gets.chomp.split(',').map(&:to_i)
    puts "#{@wf.j1.join(',')}"
    @wf.j2 = gets.chomp.split(',').map(&:to_i)
    puts "#{@wf.j2.join(',')}"
    @wf.j3 = gets.chomp.split(',').map(&:to_i)
    puts "#{@wf.j3.join(',')}"
    EQ_DIST = @wf.j1.count(1)/2
    puts "**************Moves**************************"
    @wf.queue_jars(@wf.j1,@wf.j2,@wf.j3) until @wf.j1.count(1) == EQ_DIST &&  @wf.j2.count(1) == EQ_DIST && @wf.j3.count(1) == 0
    puts "**************Result*************************"  
    puts"j1 => [#{@wf.j1.join(' ').gsub(/1/, "*").gsub(/0/, "-")}]"
    puts"j2 => [#{@wf.j2.join(' ').gsub(/1/, "*").gsub(/0/, "-")}]"
    puts"j3 => [#{@wf.j3.join(' ').gsub(/0/, "-")}]"
  

  



