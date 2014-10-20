Gem::Specification.new do |gem|
	gem.name = 'jekyll-taskhook'
	gem.version = '0.1.0'
	gem.date = '2014-10-19'
	gem.authors = ["Michael Springer"]
	gem.email = ["mike@sprngr.me"]
	
	gem.summary = 'Jekyll plugin for hooking taks runners into the build process'
	gem.description = <<-EOF
	  This project is a plugin for the Jekyll static website generator to allow use of existing
	  tasks defined in task runners such as Gulp & Grunt from within the Jekyll build process.
	EOF
	
	gem.license = "MIT"
	gem.homepage = "https://github.com/sprngr/jekyll-taskhook"
	gem.files = `git ls-files`.split($/)

	gem.add_dependency("jekyll")
end