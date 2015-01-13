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
		entry_index = table_array[0]
		start_time = table_array[1].split(" --> ")[0]
		end_time = table_array[1].split(" --> ")[1].gsub("\r","")
        content = ""
		for i in 2..table_array.length-1
			if table_array[i] != nil
		    	content += table_array[i]
	        end
	    end
		@entries << Entry.new(start_time, end_time, content, entry_index)
	end

	def get_entries
		@entries
	end

	def shift_all(milis)
		@entries.each { |entry| entry.shift_time(milis) }
	end

	def make_new_file(filename)
		final_output = ""
		@entries.each { |entry| final_output += entry.get_string }
		IO.write(filename, final_output)
	end

end

class Entry
	def initialize(start_time, end_time, content, entry_index)
		@start_time = start_time
		@end_time = end_time
		@content = content
		@entry_index = entry_index
	end

	def shift_time(milis)
		starting = Timeshifter.new(@start_time)
		@start_time = starting.add_time(milis)

		ending = Timeshifter.new(@end_time)
		@end_time = ending.add_time(milis)
	end

	def get_string()
		@entry_index + "\n" + @start_time.strftime("%H:%M:%S,%L") + " --> " + @end_time.strftime("%H:%M:%S,%L") + "\n" + @content + "\n\n"
	end
end


class Timeshifter
    def initialize(time)
        @ini_time = Time.parse(time)
    end

    def add_time(milis)
    	@ini_time += milis/1000.to_f        
    end
end

Class Spellchecker
    def initialize (entries, filname)
    end

    def create_a_checklist
       wordslist = IO.read(filname)
       entries.each do |entry| {
       	entry.content.gsub(/[\n\r]/, ' ').split(" ").each {
       	if wordslist.include? "#{entry.content.}"
       }
       wordslist << entriescontent.spilt(" ")
   }
    end

end



somename = SRTProcessing.new("ShortExample.srt")
somename.shift_all(5000)
somename.shift_all(-2000)
somename.make_new_file("output.srt")

var = Spellchecker.new(somename.get_entries, "words.txt")








