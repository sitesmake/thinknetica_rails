class Marshrut
  attr_reader :stations

  def to_s
    puts "#{stations.first}...#{stations.last}"
  end

  def initialize(start, finish)
    @stations = [start, finish]
    validate!
  end

  def valid?
    validate!
  rescue
    false
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
    puts 'Stations list'
    stations.each do |station|
      puts station
    end
  end

  protected

  def validate!
    raise 'All stations must be a Station' unless @stations.all? { |s| s.is_a? Station }
    true
  end
end
