class Train
  TYPE = [:cargo, :passenger]

  attr_reader :speed
  attr_reader :vagons
  attr_reader :marshrut
  attr_reader :type
  attr_reader :direction
  attr_reader :vagons

  def initialize(title, type, vagons)
    @title = title
    @type = type
    @vagons = vagons
    @direction = 1
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def add_vagon
    @vagons += 1 if speed == 0
  end

  def remove_vagon
    @vagons -= 1 if speed == 0 && vagons > 0
  end

  def set_marshrut(obj)
    @marshrut = obj
    @current_station = 0
  end

  def get_next_station
    if @direction == 1 && @current_station == @marshrut.stations.length-1
      @direction = -1
    else @direction == -1 && @current_station == 0
      @direction = 1
    end
    @current_station += @direction
  end

  def previous_station
    if @direction == 1 && @current_station == 0
      return "#{@marshrut.stations[1]}"
    elsif @direction == -1 && @current_station == @marshrut.stations.length - 1
      return "#{@marshrut.stations[-2]}"
    else
      return "#{@marshrut.stations[@current_station]}"
    end
  end

  def current_station
    "#{@marshrut.stations[@current_station]}"
  end

  def next_station
    if @direction == 1 && @current_station == @marshrut.stations.length - 1
      return "#{@marshrut.stations[-2]}"
    elsif @direction == -1 && @current_station == 0
      return "#{@marshrut.stations[1]}"
    else
      return "#{@marshrut.stations[@current_station + 1]}"
    end
  end

  def nearest_stations
    puts "Previous station: #{previous_station}"
    puts "Current station: #{current_station}"
    puts "Next station: #{next_station}"
  end
end
