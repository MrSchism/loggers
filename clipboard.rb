require 'clipboard'	# Ruby Gem to make the copy/paste of the clipboard easier
require 'ffi-1.9.3'	# Ruby Gem to make cliipboard gem functional with Windows

File.new(filename, 'w') unless File.exist?(filename)

class Cliplog		# Clipboard Log class
    include Clipboard
    include ffi


    if @@clip != "" &&  @@clip != @@old_clip then {

    }
    end

end
