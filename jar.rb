class Jar
    attr_accessor :jar
#    @max_size = 25
    def initialize(capacity,value)
       self.jar = []
       capacity.times do
          self.jar.append(value)
       end   
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
	end


end

class BigJar < Jar
   def initialize(capacity,value)
      super(capacity,value)
   end
public   
   def get_count()
      self.jar.count(1)
   end
   def get_size()
      self.jar.size
   end
end

class MediumJar < Jar
   def initialize(capacity,value)
      super(capacity,value)
   end
public   
   def get_count()
      self.jar.count(1)
   end
   def get_size()
      self.jar.size
   end
end

class LowJar < Jar
   def initialize(capacity,value)
      super(capacity,value)
   end
public   
   def get_count()
      self.jar.count(1)
   end
   def get_size()
      self.jar.size
   end
end

class Client

  # Assigning pair of jars to fill  
  def queue_jars(j1,j2,j3)
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
  public
    def start()
        jar_sizes = ARGV
        raise "Argument Error" if jar_sizes.size > 3 
        j1 = BigJar.new(jar_sizes[0].to_i,1)
        j2 = MediumJar.new(jar_sizes[1].to_i,0)
        j3 = LowJar.new(jar_sizes[2].to_i,0)
        eq_dist = j1.get_count / 2
        puts "*******************Moves************************"
        queue_jars(j1,j2,j3) until j1.get_count == eq_dist && j2.get_count == eq_dist && j3.get_count == 0
        puts "*******************Result***********************"
        puts "#{j1.get_count} , #{j2.get_count}, #{j3.get_count}"
        puts "*******************Represtation******************"
        puts "jar 1 => #{j1.jar.join(' ').gsub(/1/, '*').gsub(/0/, '-')}"
        puts "jar 2 => #{j2.jar.join(' ').gsub(/1/, '*').gsub(/0/, '-')}"
        puts "jar 3 => #{j3.jar.join(' ').gsub(/0/, '-')}"
    end
end

client = Client.new
client.start
