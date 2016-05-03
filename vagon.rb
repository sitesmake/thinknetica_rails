class Vagon
  TYPE = Train::TYPE

	attr_reader :type

	def initialize(type)
    raise "! ! ! Unsupported vagon type ! ! !" unless TYPE.include?(type)

		@type = type
	end
end