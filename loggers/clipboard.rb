#####################################################################################
# Clipboard_Logger.rb
# The MIT License (MIT)
#
# Copyright (c) 2014 
# Joshua "MrSchism" Embrey <mrschism@sdf.org>
# Joseph "Arcarna" Preston <jpreston86@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
##################################################################################### 

require 'clipboard'  # Ruby Gem to make the copy/paste of the clipboard easier
require 'ffi'  # Ruby Gem to make cliipboard gem functional with Windows

# Variables
old_clip = ""
clip = ""
dataDirectory = Dir.chdir("/home/joe/Documents")
zed = 1
time = Time.now

# File Check
if File.exist?("test.txt")
  File.open("test.txt",'a')
else
  File.new("test.txt",'w')
end

# Clipboard Logging 
while (zed == 1) do
clip = Clipboard.paste
  if clip != "" then
    if clip != old_clip then
      File.open("test.txt",'a') do |file| file.write "\n\n <<< FROM CLIPBOARD #{time} >>> \n\n #{clip}"
        old_clip = clip
      end
    sleep 0.25
    end
  end
end
