class AdminProgramsController < ApplicationController

	before_filter :set_user

	# Guys preset programmes section

	def bulking
		@bulking_programmes = user.program_sets.where(category: "bulking")
	end

	def lean
		@lean_programmes = user.program_sets.where(category: "lean")
	end

	def lose
		@lose_weight_programmes = user.program_sets.where(category: "lose")
	end

	# Girls preset programmes section

	def pear
		@pear_shape_programmes = user.program_sets.where(category: "pear")
	end
					
	def apple
		@apple_shape_programmes = user.program_sets.where(category: "apple")
	end

	def hour
		@hour_glass_programmes = user.program_sets.where(category: "hour")
	end
	
	def tube
		@tube_programmes = user.program_sets.where(category: "tube")
	end

	# Injuryed section

	def injuries
	end

	def avoid
	end


	def set_user
		user = User.find_by_email("support@gymsays.co.uk")
	end

end
