require 'pry'
require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'train'
require_relative 'station'
require_relative 'marshrut'
require_relative 'vagon'
require_relative 'cargo_vagon'
require_relative 'passenger_vagon'

class Interface
	def start
		loop do
			puts "create a (s)tation"
			puts "create a (t)rain"
			puts "(a)dd vagon to train"
			puts "(r)emove vagon from train"
			puts "(p)place train to station"
			puts "(v)view stations list and trains on station"
			puts "---------"
			puts "(l)oad initial data"
			puts "(d)ebug"
			puts "---------"
			puts "e(x)it"

			input = gets.chomp

			case input
			when 's'
				create_station
			when 't'
				create_train
			when 'a'
				add_vagon
			when 'r'
				remove_vagon
			when 'p'
				place_train_to_station
			when 'v'
				view_stations_and_trains
			when 'l'
				load_initial_data
			when 'd'
				binding.pry
			when 'x'
				break
			end
		end
	end

	private

	def load_initial_data
		train1 = Train.new('poezd-cargo', :cargo)
		train2 = Train.new('poezd-passenger', :passenger)

		station1 = Station.new('adler')
		station2 = Station.new('sochi')
		station3 = Station.new('dagomys')
		station4 = Station.new('tuapse')

		marshrut1 = Marshrut.new(station1, station4)

		marshrut1.add_station(station2)
		marshrut1.add_station(station3)

		train1.set_marshrut(marshrut1)
		train2.set_marshrut(marshrut1)

		5.times do
			vagon1 = CargoVagon.new
			train1.add_vagon(vagon1)
		end

		10.times do
			vagon2 = PassengerVagon.new
			train2.add_vagon(vagon2)
		end

	end

	def create_station
		Station.new(get_station_title)
	end

	def create_train
		Train.new(get_train_title, get_train_type)
	end

	def new_vagon(type)
    Object.const_get(type.capitalize.to_s + "Vagon").new
  end

	def add_vagon
		train = select_train
		vagon = new_vagon(train.type)
		train.add_vagon(vagon)
	end

	def remove_vagon
		train = select_train
		train.remove_vagon
	end

	def place_train_to_station
		select_train.move_to_station(select_station)
	end

	def get_station_title
		puts "Title for station:"
		gets.chomp
	end

	def select_station
		puts "Select station:"

		index = -1
		Station.all.each do |station|
			index += 1
			puts "(#{index}) #{station.title}"
		end

		selected = gets.chomp.to_i

		Station.all[selected]
	end

	def get_train_type
		puts "Select train type:"

		index = -1
		Train::TYPE.each do |type|
			index += 1
			puts "(#{index}) #{type}"
		end

		selected = gets.chomp.to_i

		Train::TYPE[selected]
	end

	def get_train_title
		puts "Title for train:"
		gets.chomp
	end

	def get_train_vagons
		puts "Number of vagons:"
		gets.chomp.to_i
	end

	def select_train
		puts "Select train:"

		index = -1
		Train.all.each do |train|
			index += 1
			puts "(#{index}) #{train.title}"
		end

		selected = gets.chomp.to_i

		Train.all[selected]
	end

	def view_stations_and_trains
		Station.all.each do |station|
			puts "Station: #{station.title}"
			puts "Trains:"
			Train.all.each do |train|
				puts train.title if train.current_station == station
			end
		end
	end
end

Interface.new.start