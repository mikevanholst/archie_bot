require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "Archie_bot"
channel = "#archie_b"
greeting_prefix = "privmsg #{channel} :"
greetings = ["hello"]
commands = [ "repeat", "brindleton", "archie", "speak", "cat", "walk", "shake a paw" "roll over", "treat", "treat", "sit" ] 

puts greetings.inspect
irc_server = TCPSocket.open(server, port)

irc_server.puts "USER bhellobot 0 * BHelloBot"
irc_server.puts "NICK #{nick}"
irc_server.puts "JOIN #{channel}"
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"

# Hello, Bot!
until irc_server.eof? do
    msg = irc_server.gets.downcase
    puts msg


# message = msg.include? ":"
#  response = message   

        # irc_server.puts "PRIVMSG #{channel} :#{response}"

    wasGreeted = false
    greetings.each do |g|
    wasGreeted = true if msg.include? g
    end

    wasCommanded = false
    commands.each do |c|
    wasCommanded = true if msg.include? c
    end


  if msg.include? greeting_prefix and wasGreeted
      response = "Hi, I'm happy to chat. However I'm a dog so I only respond to a limited dog vocabulary."
         irc_server.puts "PRIVMSG #{channel} :#{response}"
    end


    if msg.include? greeting_prefix and wasCommanded
    
       response = ""   if msg.include? "play dead"

       # response = "That's my name don't wear it out."   if msg.include? "archie"

        response = "In this instance I can only type but perhaps the words woof woof will satisfy you." if msg.include? "speak" 
          
        
        response = "I don't care for cats."  if msg.include?  "cat"
           
        response = "Did you just say scooby-snack?"  if msg.include? "roll over"
    
        response = "Just what am I going to have to do for this treat?"  if msg.include? "treat"

         response = "Sure if you can give me a hand."  if msg.include? "shake a paw"

          response = "Don't tease me, walks are serious business in a dogs life."  if msg.include? "walk"

          response = "As for tricks; I can speak, shake a paw, roll over, and play dead ."  if msg.include? "trick"  

          response = "Sorry I have to stand in order to see the monitor and reach the keyboard."  if msg.include? "sit"    

          response = "#{msg}" if msg.include? "repeat"


        irc_server.puts "PRIVMSG #{channel} :#{response}"
   end


end #until
