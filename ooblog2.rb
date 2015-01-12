#Blog

require "date"

class Blog
	
	def add_posts(title, text)
		container = {}
		container << Post.new(title, text)
	end


	def print_posts
		puts @container

	end


end




class Post
	attr_accessor :title, :text
	def initialize(title, text)

	end
end


blog = Blog.new
blog.add_posts("Blogblogblog", "Hier blogge ich meinen Lorem Ipsum")
blog.add_posts("123123", "hesslo")
blog.print_posts

