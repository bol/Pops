#!/usr/bin/env ruby

require 'socket'
require 'zlib'

require 'world.rb'

size = 30

w = World.new(size)
Thread.new do
	loop do
		w.heightMap[rand(size)][rand(size)] = rand(10)
		sleep(1)
	end
end

dts = TCPServer.new('localhost', 20000)
loop do
	Thread.start(dts.accept) do |s|
		print(s, " is accepted\n")
		s.write(Zlib::Deflate.deflate(Marshal.dump(w)))
		print(s, " is gone\n")
		s.close
	end
end
