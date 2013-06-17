fs = require "fs"
{print} = require 'util'
{spawn, exec} = require 'child_process'

# bold = '\033[0;1m'
# green = '\033[0;32m'
# reset = '\033[0m'
# red = '\033[0;31m'

bold = green = reset = red = ""

config = 
	src_dir: "src"
	dest_dir: "build"
	static_files: [ "manifest.json", "popup.html", "popup.css" ]

log = (message, color, explanation) -> 
	console.log color + message + reset + ' ' + (explanation or '')

launch = (cmd, options=[], callback) ->
	command = "#{cmd} #{options.join(' ')}"
	app = exec command, (err, stdout, stderr) ->
		log stdout, green
		log stderr, red if err
	
	app.on "exit", (status) => callback?() if status is 0

build = (watch, callback) ->
	if typeof watch is 'function'
		callback = watch
		watch = false

	options = ['-c', '-o', config.dest_dir, config.src_dir]
	options.unshift '-w' if watch
	launch 'coffee', options, ->
		# move static files
		for file in config.static_files
			if fs.existsSync "#{config.dest_dir}/#{file}"
				fs.unlinkSync "#{config.dest_dir}/#{file}"

			fs.linkSync "#{config.src_dir}/#{file}", "#{config.dest_dir}/#{file}"

		callback?()

task 'build', 'compile source', -> 
	build -> 
		log "Done", green

task 'watch', 'compile source', -> 
	build true, -> 
		log "Done", green