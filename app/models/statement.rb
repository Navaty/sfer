class Statement < ApplicationRecord
  mount_uploader :certificate, CertificateUploader
  belongs_to :test

  validates :name, :soname, :father_name, :email, :position, :place, presence: true


  def self.find_statement(search)
	statemets = Statement.all
	if search.present?
		statemets = statemets.where("paid = 't'") if search[:paid].present?
		statemets = statemets.where("id = ?", search[:ticket_id]) if search[:ticket_id].present?
		statemets = statemets.where("email LIKE ?", "%#{search[:email]}%") if search[:email].present?
		statemets = statemets.where("name LIKE ?", "%#{search[:fio]}%") if search[:name].present?
		statemets = statemets.where("soname LIKE ?", "%#{search[:fio]}%") if search[:soname].present?
		statemets = statemets.where("father_name LIKE ?", "%#{search[:fio]}%") if search[:father_name].present?
		statemets = statemets.where("updated_at >= ?", search[:date][:start].to_date) if !search[:date][:start].blank?
		statemets = statemets.where("updated_at <= ?", search[:date][:end].to_date) if !search[:date][:end].blank?
	end
	statemets
  end

end
