class Route
  attr_reader :stations

  def initialize(start, finish)
    @stations = [start, finish]
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def remove_station(station)
    first = stations.shift
    last = stations.pop
    removed = stations.delete station
    stations.unshift first
    stations.push last
    removed
  end

  def list_stations
    puts "Stations list"
    stations.each do |station|
      puts station
    end
  end
end
