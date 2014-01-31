#  Clipboard_Logger.rb
#  
#  Copyright 2014
#  Joshua "Mr. Schism" Embrey <mrschism@sdf.org>
#  Joseph "Arcarna" Preston <jpreston86@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  

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
