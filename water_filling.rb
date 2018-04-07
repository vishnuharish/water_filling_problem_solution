
	@j1 = [1,1,1,1,1,1,1,1]
	@j2 = [0,0,0,0,0]
	@j3 = [0,0,0]

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


  def queue_jars(j1,j2,j3)
     if (j1.count(1) == j1.size || j1.count(1) > j2.size) && (j2.count(1) == 0)
        puts "j1 -> j2"
        fill(j1,j2)
     elsif (j3.count(1) < j3.size) && (j2.count(1) !=0) || (j2.count(1) == j2.size ) && (j3.count(1) == 0)
        puts "j2 -> j3"
        fill(j2,j3)   
     else
         puts "j3 -> j1"
        fill(j3,j1)               
     end
  end
  puts"*****************Distributions***********************"
  queue_jars(@j1,@j2,@j3) until @j1.count(1) == 4 && @j2.count(1) == 4  
  puts"******************Result*****************************"
  puts"#{@j1.count(1)} #{@j2.count(1)} #{@j3.count(1)}"

  puts"******************Representations********************"
  puts "Jar 1 => [#{@j1.join(' ').gsub!(/1/,'*').gsub!(/0/,'-')}]"
  puts "Jar 2 => [#{@j2.join(' ').gsub!(/1/,'*').gsub!(/0/,'-')}]"
  puts "Jar 3 => [#{@j3.join(' ').gsub!(/0/,'-')}]"
  puts"LEGEND: * -> 1l"

  



