class Train
  include Manufacturer

  TYPE = [:cargo, :passenger]

  @@trains = []

  attr_reader :speed
  attr_reader :vagons
  attr_reader :marshrut
  attr_reader :type
  attr_reader :direction
  attr_reader :vagons
  attr_reader :title
  attr_reader :number

  def initialize(title, type, number)

    @title = title
    @type = type

    @speed = 0
    @direction = 1

    @vagons = []

    @number = number

    validate!

    @@trains << self

    #puts "* * * Created '#{@title}' #{@type} train * * *"
  end

  def self.all
    @@trains
  end

  def valid?
    validate!
  rescue
    false
  end

  def format
    "#{number}/#{type}/#{vagons.size}"
  end

  def self.find(number)
    search = number.to_s

    Train.all.each do |train|
      return train if train.number == search
    end

    puts "! ! ! No train '#{search}' found ! ! !"
    nil
  end

  def accelerate
    @speed += 10
  end

  def brake
    @speed = 0
  end

  def set_marshrut(obj)
    @marshrut = obj
    @current_station = 0
    #puts "* * * Поезду '#{title}' задан новый маршрут #{obj} * * *"
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
      #puts "* * * Поезд '#{title}' размещен на станции #{current_station} * * *"
      self
    elsif @marshrut.nil?
      new_marshrut = Marshrut.new(station, station)
      set_marshrut(new_marshrut)
      #puts "* * * Поезд '#{title}' размещен на станции #{current_station} * * *"
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

  def add_vagon(vagon)
    if speed == 0 && vagon.type == type && !attached_vagons.include?(vagon)
      @vagons << vagon
      vagon.number = @vagons.size
      #puts "* * * Вагон #{vagon} добавлен к поезду #{self} * * *"
      self
    else
      #puts "! ! ! Добавление вагонов в движущемся поезде невозможно ! ! !" unless speed == 0
      #puts "! ! ! Тип вагона #{vagon.type} не соответствует типу поезда #{type} ! ! !" unless vagon.type == type
      #puts "! ! ! Вагон #{vagon} уже прицеплен. Сначала отцепите. ! ! !" if attached_vagons.include?(vagon)
      false
    end
  end

  def remove_vagon
    if speed == 0 && vagons.size >= 1
      removed = @vagons.pop
      removed.number = nil
      #puts "* * * Из поезда #{self} удален вагон #{removed} * * *"
      removed
    else
      #puts "! ! ! Отцепление вагонов в движущемся поезде невозможно ! ! !" unless speed == 0
      #puts "! ! ! Вагоны отсутствуют ! ! !" unless vagons.size == 0
      false
    end
  end

  def attached_vagons
    attached_vagons = []
    Train.all.each do |train|
      train.vagons.each do |vagon|
        attached_vagons << vagon
      end
    end
    attached_vagons
  end

  def each_vagon
    vagons.each do |vagon|
      yield(vagon) if block_given?
    end
  end


  protected

  def validate!
    raise "Train must have a valid title" unless @title =~ /\S/
    raise "Unsupported train type" unless TYPE.include?(@type)
    raise "Wrong number format (XXX[-]XX)" unless @number =~ /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i
    raise "Train with number #{@number} already exists" if @@trains.any? { |t| t.number == @number }
    true
  end

end
