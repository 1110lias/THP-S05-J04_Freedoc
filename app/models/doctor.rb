class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  belongs_to :city
  has_many :specialty_doctor_joins
  has_many :specialties, through: :specialty_doctor_joins
end
