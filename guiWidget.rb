require 'socket'
require 'zlib'
require 'Qt4'

require 'world.rb'

class Gui < Qt::Widget
	slots 'updateWorld()'

	def initialize
		super()

		setPalette(Qt::Palette.new(Qt::Color.new(23, 23, 23)))
		setAutoFillBackground(true)
		updateWorld

		@updateTimer = Qt::Timer.new(self)
		connect(@updateTimer, SIGNAL('timeout()'),self,SLOT('updateWorld()'))
		@updateTimer.start(1000)
	end

	def updateWorld
		streamSock = TCPSocket.new( "127.0.0.1", 20000 )
		@world = Marshal.load(Zlib::Inflate.inflate(streamSock.read))
		streamSock.close

		update()
	end

	def paintEvent(event)
		painter = Qt::Painter.new(self)

		paintWorld(painter)

		painter.end()
	end

	def paintWorld(painter)
		@world.heightMap.length.times { |x|
			@world.heightMap[x].length.times { |y|
				paintCell(painter,x,y,@world.heightMap[x][y])
			}
		}
	end

	def paintCell(painter,x,y,value)
		if (value == 0)
			color = Qt::Color.new(Qt::darkBlue)
		elsif (value == 1)
			color = Qt::Color.new(Qt::blue)
		elsif (value == 9)
			color = Qt::Color.new(Qt::darkGray)
		else
			color = Qt::Color.new(value,value*25,0)
		end

		painter.setPen(Qt::Pen.new(Qt::Color.new(Qt::black)))
		painter.setBrush(Qt::Brush.new(color))

		painter.drawRect(Qt::Rect.new(x*10,y*10,10,10))
	end
end
