# Jekyll plugin for hooking taks runners into the build process
#
# Currently supports grunt, gulp, npm, and rake.
#
# List your task runner and tasks to run in _config.yml
# Will run all tasks runners listed in alphabetical order.
#
# Accepts any of the following attributes in _config.yml:
#  grunt
#  gulp
#  npm
#  rake
#
#
# Example configuration entry:
#
# gulp: [clean, concat, build]
#
# or
#
# gulp:
#  - clean
#  - concat
#  - build

module Jekyll
	class JekyllTaskHook < Jekyll::Generator

		safe true

		attr_accessor :site

	    # Main plugin action, called by Jekyll-core
	    def generate(site)
	    	@site = site

	    	get_tasks
	    end

	    # Dumps task list from _config.yml
	    def get_tasks
	    	print "Jekyll-TaskHook:\n"
	    	print "\tChecking for tasks...\n"

	    	grunt = site.config["grunt"]
	    	gulp  = site.config["gulp"]
	    	npm   = site.config["npm"]
	    	rake  = site.config["rake"]

	    	if grunt || gulp || npm || rake then
	    		if grunt then
	    			exists = node_cmd_exists("grunt")

	    			if exists then
	    				print "\tFound Grunt tasks: #{grunt}\n"

		    			gruntfile = File.file?("gruntfile.js")
		    			if !gulpfile then 
		    				print "\tCannot find gruntfile\n"
		    			else
		    				run_tasks("grunt", grunt)
		    			end
	    			else
	    				print "\tCannot find grunt\n"
	    				print "\tTry running: npm install grunt grunt-cli\n"
					end 
	    		end
	    		if gulp then
	    			exists = node_cmd_exists("gulp")

	    			if exists then
	    				print "\tFound Gulp tasks: #{gulp}\n"

		    			gulpfile = File.file?("gulpfile.js")
		    			if !gulpfile then 
		    				print "\tCannot find gulpfile\n"
		    			else
		    				run_tasks("gulp", gulp)
		    			end
	    			else
	    				print "\tCannot find gulp\n"
	    				print "\tTry running: npm install gulp\n"
					end 
	    		end
	    		if npm then
	    			# TODO
		    	end
		    	if rake then
		    		# TODO
		    	end
		    else
		    	print "\tNo tasks found.\n"
		    end 
	    	print "\r"
		end

		# Runs each individual task
		def run_tasks(taskRunner, taskArray)
			print "\nRunning #{taskRunner}...\n"
			taskArray.each do |task|
				case taskRunner
				when "npm"
					system(taskRunner, "run #{task}")
					break;
				else
					system(taskRunner, task)
				end
			end
		end

		# Utility method for crossplatform 'which'
		def which(cmd)
			exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']

			ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
				exts.each { |ext|
					exe = File.join(path, "#{cmd}#{ext}")
					return exe if File.executable?(exe) && !File.directory?(exe)
				}
			end
			return nil
		end

		#Utility method for checking if node_modules/{excutable} exists
		def node_cmd_exists(cmd)
			node_modules = File.exists?("node_modules")
			
			if node_modules then
				cmd_exists = File.exists?("node_modules/#{cmd}")
				return cmd_exists
			else
				return false
			end
			return nil
		end
	end
end