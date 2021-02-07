class Tcategory < ApplicationRecord
	has_many :tests

	validates :title, presence: true
end
