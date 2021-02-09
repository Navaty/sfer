class Test < ApplicationRecord
  belongs_to :tcategory
  has_many :questions, dependent: :destroy
  mount_uploader :certificate, CertificateUploader

  validates :title, presence: true

  accepts_nested_attributes_for :questions, allow_destroy: true 
end
