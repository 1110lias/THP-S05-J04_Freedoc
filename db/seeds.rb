# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Ensure the Faker gem is required
require 'faker'

# Create 10 random doctors
10.times do
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    speciality: Faker::Lorem.word,
    zip_code: Faker::Address.zip_code
  )
end

# Create 100 random patients
100.times do 
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  )
end

# Create 180 random appointments
180.times do
  start_date = DateTime.new(2022, 1, 1)
  end_date = DateTime.new(2083, 12, 31)
  random_seconds = rand((start_date.to_f..end_date.to_f))
  random_date = DateTime.strptime(random_seconds.to_s, '%s')
  Appointment.create(
    date: random_date,
    doctor_id: Doctor.pluck(:id).sample,
    patient_id: Patient.pluck(:id).sample
  )
end

