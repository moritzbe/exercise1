#This is the blog class This is very simple.
#Implement a Blog class where you can add Post objects. 
#Each post will have a title, a date and a text. 
#Then add a front_page method at Blog that returns the front page of the blog in the following format:

require "date"

class OOBlog 
    def initialize
        @posts = []
    end

    def add_post(title, text)
    	@posts << Post.new(title, text)
    end

	def front_page
		@posts.each do |post| 

			puts "#{post.title}\n*************************************
			\n#{post.text}\n-------------------------------------"
		end
	end

end

class Post
	attr_reader :title, :text, :date

	def initialize(title, text)
		@title = title
		@text = text
	end
end


blog = OOBlog.new
blog.add_post("Second Post", "Lorem ipsum is also the second text")
blog.add_post("Third Post", "Lorem ipsum is even the third text")
blog.front_page