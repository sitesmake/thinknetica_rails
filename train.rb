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

  def nearest_stations
    puts "Previous staion:"
    if @direction == 1 && @current_station == 0
      puts "#{@marshrut.stations[1]}"
    elsif @direction == -1 && @current_station == @marshrut.stations.length - 1
      puts "#{@marshrut.stations[-2]}"
    else
      puts "#{@marshrut.stations[@current_station]}"
    end

    puts "Current station:"
    puts "#{@marshrut.stations[@current_station]}"

    puts "Next station:"
    if @direction == 1 && @current_station == @marshrut.stations.length - 1
      puts "#{@marshrut.stations[-2]}"
    elsif @direction == -1 && @current_station == 0
      puts "#{@marshrut.stations[1]}"
    else
      puts "#{@marshrut.stations[@current_station + 1]}"
    end
  end
end
