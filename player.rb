class Player
	attr_reader :type

	def initialize(args)
		@type = args[:type]
	end
end