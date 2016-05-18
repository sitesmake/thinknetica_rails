class Station
  attr_accessor :trains
  attr_accessor :title

  @@stations = []

  def to_s
    title
  end

  def initialize(title)
    @title = title

    validate!

    @@stations << self

    # puts "* * * Created '#{title}' station * * *"
  end

  def self.all
    @@stations
  end

  def valid?
    validate!
  rescue
    false
  end

  def show_trains(type = nil)
    if type
      puts "#{Train::TYPE[type].capitalize} trains on station"
    else
      puts 'Trains on stations:'
    end

    trains.each do |train|
      if type
        puts train.title if train.type == type
      else
        puts train.title
      end
    end
  end

  def each_train
    trains.each do |train|
      yield(train) if block_given?
    end
  end

  protected

  def validate!
    raise 'Station must have a valid title' unless @title =~ /\S/
    raise 'Station title must be unique' if @@stations.any? { |s| s.title == @title }
    true
  end
end
