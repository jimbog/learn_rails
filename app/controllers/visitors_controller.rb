class VisitorsController < ApplicationController

	def new
		@owner = Owner.new
    flash[:notice] = "welcome!"
    flash[:alert] = "remember my birthday is coming up, get me a nice present"
	end

end
