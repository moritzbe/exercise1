class SRTProcessing
	def initialize(filename)
		@entries = []
		# read and fulfill the entries array with every entry
		parse(filename)
	end

	def parse(filename)
		lines_str = IO.read(filename)
		entries_array = lines_str.split("\n\n")
		entries_array.each { |entry| split_entry(entry) } 

		# lines.each do |line|
		#	indexcounter = 1
		#	if line.to_i == indexcounter
		#		indexcounter++
		#	elsif line.content("-->")
		#		time_str = line.split("-->")
		#		puts time_str
		#		start_time = time_str[0]
		#		end_time = time_str[1]
		#	elsif line == '\n'
		#		# @entries << Entry.new(start_time, end_time, content)
		#	elsif 
		#end
	end

	def split_entry(entry)
		table_array = entry.split("\n")
		puts "Table array is: "
		puts table_array
		# 00:01:58,134 --> 00:02:00,753
		# start_time = table_array[1].
		# @entries << Entry.new(start_time, end_time, content)
	end

end

class Entry
	def initialize(start_time, end_time, content)
		@start_time = start_time
		@end_time = end_time
		@content = content
	end
end

process = SRTProcessing.new("ShortExample.srt")
