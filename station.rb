class Station
  attr_accessor :trains
  attr_accessor :title

  def to_s
    title
  end

  def initialize(title)
    @title = title
  end

  def show_trains(type = nil)
    if type
      puts "#{Train::TYPE[type].capitalize} trains on station"
    else
      puts "Trains on stations:"
    end

    @trains.each do |train|
      if type
        puts train.title if train.type == type
      else
        puts train.title
      end
    end
  end
end
