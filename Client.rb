# => Troy Gallagher, 11352566
# => Lab02
# => Make a server and client
# => The client must connect to the server.
# => The client can send requests
# => Close the connection

require 'net/http'
require 'uri'
require 'socket'

# => Where program will connect, give address
hostname = 'localhost'
extra = "?message="
port = 8000
_test = ""

s = TCPSocket.open(hostname, port)


while _test != "KILL_SERVICE\n"

	# => Ask for user input
	puts "Enter a scentence:"

	# => Get user input
	_test = gets
	s.write(_test)#Send message to server
	#Wait for server response
	#Then print server response
	puts "Server:   "
	while line = s.gets
  		puts line
	end

end


# => Program end