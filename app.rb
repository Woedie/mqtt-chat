require 'rubygems'
require 'mqtt'

puts  'Who are you?'
@name = gets.chomp


Thread.new do
  while true
      puts  'Enter messages:'
      text = gets
      # Publish example
      MQTT::Client.connect('10.177.33.144') do |c|
        c.publish('BABL', @name + ': ' + text)
      end
  end
end



# Subscribe example
MQTT::Client.connect('10.177.33.144') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('BABL') do |topic,message|
    puts "#{topic}: #{message}"
  end
end
