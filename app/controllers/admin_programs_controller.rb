class AdminProgramsController < ApplicationController

	def index
		user = User.find_by_email("spthomas145@gmail.com")

		# male preset programmes
		fat_burn_programmes = user.program_sets.where(category: "fat burn")
		muscle_build_programmes = user.program_sets.where(category: "muscle build")

		# female preset programmes
		pear_shape_programmes = user.program_sets.where(category: "pear shape")
		apple_shape_programmes = user.program_sets.where(category: "apple shape")
		hour_glass_programmes = user.program_sets.where(category: "hour glass")
		tube_programmes = user.program_sets.where(category: "tube")
	end

end
