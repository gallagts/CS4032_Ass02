# => Troy Gallagher, 11352566
# => Lab02
# => Make a server and client
# => The server is to handle incoming connections
# => Once a client has connected, pass the client to a thread pool
# => Assignn a thread to handle the client.
# => Go back to waiting for client connections

require 'socket'# Get socket imported
require 'thread'# Get threads imported

#Main
port = 8000
server = TCPServer.open(port)   # Listen to socket 8000
_test = ""
while 1
workers = (0...4).map do #4 Threads in pool
	Thread.start(server.accept) do |client|
  		begin
  			puts "Client accepted"

  			while _test != "KILL_SERVICE\n"# => Loop until user kills

  				_test = client.gets#Read inpit from client
  				puts _test

  				# => Action depends on client input
  				if _test == "KILL_SERVICE\n"
  					client.puts("Closing connection") # Send the capitalised text to the client
    				client.close
    				puts "Connection Closed"	# Disconnect from the client
  				elsif _test == "HELO\n"
  					client.puts("HELO text\nIP:[#{IPSocket.getaddress(Socket.gethostname)}]\nPort:[#{port}]\nStudentID:[11352566]\n")#Print my data
  				else 
  					client.puts(_test) # Send same message back
  				end

  			end
  		end
  	end
end
	workers.map(&:join) #Let all workers finish, then end threads.
# => END OF PROGRAM
end