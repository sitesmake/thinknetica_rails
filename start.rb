require 'pry'
require './train.rb'
require './station.rb'
require './route.rb'

train1 = Train.new('poezd1', 0, 10)

station1 = Station.new('adler')
station2 = Station.new('sochi')
station3 = Station.new('dagomys')
station4 = Station.new('tuapse')

route1 = Route.new(station1, station4)

route1.add_station(station2)
route1.add_station(station3)

train1.set_marshrut(route1)

binding.pry
