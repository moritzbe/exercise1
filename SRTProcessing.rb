require "pry"
require "time"


class SRTProcessing
	def initialize(filename)
		@entries = []
		# read and fulfill the entries array with every entry
		parse(filename)
	end

	def parse(filename)
		lines_str = IO.read(filename)
		entries_as_array = lines_str.split("\n\r\n")
		entries_as_array.each { |entry| split_entry(entry) } 


	end

	def split_entry(entry)
		table_array = entry.split("\n")
		# 00:01:58,134 --> 00:02:00,753
		start_time = table_array[1].split(" --> ")[0]
		end_time = table_array[1].split(" --> ")[1]
          content = "" 
		  for i in 2..table_array.length-1
		  	if table_array[i] != nil
		    	content += table_array[i]
		    	#binding.pry
	        end
	      end

		@entries << Entry.new(start_time, end_time, content)
		puts @entries
	end

end

class Entry
	def initialize(start_time, end_time, content)
		@start_time = start_time
		@end_time = end_time
		@content = content
	end
   
end


class Timeshifter
    def initialize(time)
        # @ini_time = Time.new(2015, 1, 1, time.split(":")[0].to_i, time.split(":")[1].to_i, time.split(":")[2].gsub(',','.').to_f)
        @ini_time = Time.parse('01:31:51,210')
    end

    def add_time(milis)
    	puts @ini_time += milis/1000.to_f
        
    end
end


time = Timeshifter.new('01:31:51,210')
time.add_time(2000)

