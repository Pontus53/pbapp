require 'socket' # Provides TCPServer and TCPSocket classes

# Initialize a TCPServer object
server = TCPServer.new('192.168.1.160', 2345)

# loop infinitely
loop do
  socket = server.accept
  request = "GET /xzy HTTP/1.1"
  request = socket.gets

  # Log the request to the console for debugging
  STDERR.puts request

  def action(request)
    action = request.split(' ')[1].delete('/')
  end

  if action(request) == "play"
    
  end

  if action(request) == "pause"
    
  end

  if action(request) == "shutdown"
    exit
  end

  response = "Hello World!\n"

  # We need to include the Content-Type and Content-Length headers
  # to let the client know the size and type of data
  # contained in the response. Note that HTTP is whitespace
  # sensitive, and expects each header line to end with CRLF (i.e. "\r\n")
  socket.print "HTTP/1.1 200 OK\r\n" +
               "Access-Control-Allow-Origin: http://pbapp.webatu.com\r\n" +
               "Access-Control-Allow-Credentials: true\r\n" +
               "Access-Control-Expose-Headers: FooBar\r\n" +
               "Content-Type: text/plain\r\n" +
               "Content-Length: #{response.bytesize}\r\n" +
               "Connection: close\r\n"

  # Print a blank line to separate the header from the response body,
  # as required by the protocol.
  socket.print "\r\n"

  # Print the actual response body, which is just "Hello World!\n"
  socket.print response

  # Close the socket, terminating the connection
  socket.close
end