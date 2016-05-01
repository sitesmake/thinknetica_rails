class Train
  #поезд создается только через наследуемые классы
  private_class_method :new

  TYPE = [:cargo, :passenger]

  @@trains = []

  attr_reader :speed
  attr_reader :vagons
  attr_reader :marshrut
  attr_reader :type
  attr_reader :direction
  attr_reader :vagons
  attr_reader :title

  def initialize(title, type, vagons)

    @title = title
    @type = type

    @speed = 0
    @direction = 1

    @vagons = []
    add_vagons(vagons)

    @@trains << self

    puts "* * * Created '#{@title}' #{@type} train with #{vagons} vagons * * *"
  end

  def self.all
    @@trains
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def add_vagon
    add_vagons(1)
  end

  def remove_vagon
    remove_vagons(1)
  end

  def set_marshrut(obj)
    @marshrut = obj
    @current_station = 0
    puts "* * * Поезду '#{title}' задан новый маршрут #{obj} * * *"
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
    @marshrut.stations[@current_station]
  end

  def move_to_station(station)
    if @marshrut && @marshrut.stations.include?(station)
      @current_station = @marshrut.stations.index(station)
      puts "* * * Поезд '#{title}' размещен на станции #{current_station} * * *"
      self
    elsif @marshrut.nil?
      new_marshrut = Marshrut.new(station, station)
      set_marshrut(new_marshrut)
      puts "* * * Поезд '#{title}' размещен на станции #{current_station} * * *"
      self
    else
      puts "! ! ! Станция не входит в список маршрутов ! ! !"
      nil
    end
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

  def add_vagons(quantity)
    new_vagons = []
    if speed == 0
      quantity.times do
        new_vagons << Vagon.new(@type)
      end
      @vagons << new_vagons
      puts "* * * Добавлено #{quantity} вагонов * * *"
      new_vagons
    end
  end

  def remove_vagons(quantity)
    if speed == 0 && vagons.size >= quantity
      quantity.times do
        removed << @vagons.pop
      end
      puts "* * * Удалено #{quantity} вагонов * * *"
      removed
    end
  end

end
