class Jar
  attr_accessor :jar
  def initialize(capacity,value)
     @jar = []
     capacity.times do
        @jar.append(value)
     end
     jar = @jar   
  end
    
	def self.fill(from, to)
	   to.jar.each_with_index do |val, i|
	    if to.jar.count(1) == to.jar.size 
	       break
	    elsif from.jar[i].nil? || from.jar.index(1).nil?
	       break   
	    else
	      from.jar[from.jar.index(1)] = 0
	      to.jar[to.jar.index(0)] = 1
	    end
	   end 
	   from.jar.sort!.reverse!
	   return[from.jar, to.jar]
	end
	public
   def get_count()
      jar.count(1)
   end
   def get_size()
      jar.size
   end

end

class Client
  # Assigning pair of jars to fill  
  def self.queue_jars(j1,j2,j3)
     if (j1.get_count == j1.get_size || j1.get_count > j2.get_size) && (j2.get_count == 0)
        puts "j1 -> j2"
        Jar.fill(j1,j2)
     elsif ((j3.get_count < j3.get_size) && (j2.get_count !=0)) || ((j2.get_count == j2.get_size ) && (j3.jar.count(1) == 0))
        puts "j2 -> j3"
        Jar.fill(j2,j3)   
     else
         puts "j3 -> j1"
        Jar.fill(j3,j1)               
     end
  end
  
    def start(size_1, size_2, size_3)
        
         
        @j1 = Jar.new(size_1,1)
        @j2 = Jar.new(size_2,0)
        @j3 = Jar.new(size_3,0)
        eq_dist = @j1.get_count / 2
        puts "*******************Moves************************"
        Client.queue_jars(@j1,@j2,@j3) until @j1.get_count == eq_dist && @j2.get_count == eq_dist && @j3.get_count == 0
        puts "*******************Represtation******************"
        puts "jar 1 => #{@j1.jar.join(' ').gsub(/1/, '*').gsub(/0/, '-')}"
        puts "jar 2 => #{@j2.jar.join(' ').gsub(/1/, '*').gsub(/0/, '-')}"
        puts "jar 3 => #{@j3.jar.join(' ').gsub(/0/, '-')}"
        return [@j1.jar, @j2.jar, @j3.jar]
    end
end

#client = Client.new
#client.start(8,5,3)
