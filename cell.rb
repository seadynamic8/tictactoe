class Cell
	attr_accessor :value

	def initialize(args = {})
		@value = args.fetch(:value, "")
	end
end