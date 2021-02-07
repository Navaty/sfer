class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true

  accepts_nested_attributes_for :answers, allow_destroy: true 
end
