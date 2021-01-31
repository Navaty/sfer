class PagesController < ApplicationController
	def wellcome
		@tcategory = Tcategory.includes(:tests)
	end
end
