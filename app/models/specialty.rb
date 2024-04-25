class Specialty < ApplicationRecord
  has_many :specialty_doctor_joins
  has_many :doctors, through: :specialty_doctor_joins
end
