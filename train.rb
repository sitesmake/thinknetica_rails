class Train
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
    raise "! ! ! Unsupported train type ! ! !" unless TYPE.include?(type)

    @title = title
    @type = type

    @speed = 0
    @direction = 1

    @vagons = []
    add_vagons(vagons, @type)

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

  def add_vagon(type)
    add_vagons(1, type)
  end

  def remove_vagon(type)
    remove_vagons(1, type)
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

  def add_vagons(quantity, type)
    if speed == 0 && @type == type
      new_vagons = []
      quantity.times do
        @vagons << new_vagon(type)
      end
      puts "* * * Добавлено #{quantity} вагонов * * *"
      @vagons
    else
      puts "! ! ! Добавление вагонов в движущемся поезде невозможно ! ! !" unless speed == 0
      puts "! ! ! Тип вагона #{type} не соответствует типу поезда #{@type} ! ! !" unless type == @type
      false
    end
  end

  def remove_vagons(quantity, type)
    if speed == 0 && vagons.size >= quantity
      quantity.times do
        removed << @vagons.pop
      end
      puts "* * * Удалено #{quantity} вагонов * * *"
      removed
    else
      puts "! ! ! Отцепление вагонов в движущемся поезде невозможно ! ! !" unless speed == 0
      puts "! ! ! Количество удаляемых вагонов больше имеющегося ! ! !" unless vagons.size >= quantity
      false
    end
  end

  def new_vagon(type)
    Object.const_get(type.capitalize.to_s + "Vagon").new
  end
end
