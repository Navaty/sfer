class PagesController < ApplicationController
	def welcome
		@tcategory = Tcategory.includes(:tests)
	end

	def contact
	end

	def policy
	end
end
