#!/usr/bin/env ruby

require 'socket'
require 'Qt4'

require 'guiWidget.rb'
require 'world.rb'

app = Qt::Application.new(ARGV)

window = Gui.new()
window.resize(300,300)
window.show()

app.exec()
