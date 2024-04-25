require 'faker'
# destroy all
Appointment.destroy_all
City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all
SpecialtyDoctorJoin.destroy_all

# numbers of..
n_of_patients = 10
n_of_doctors = 10
n_of_cities = 6
n_of_appointments = 30
n_of_specialties = 4
n_of_specialty_doctor_joins = 8

# loops
n_of_cities.times do |index|
  City.create(name: Faker::Address.city)
end

puts "cities created!"

n_of_patients.times do |index|
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: rand(1..n_of_cities)
    )
end

puts "patients created!"

n_of_doctors.times do |index|
  Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: rand(1..n_of_cities),
    zip_code: rand(4400..7500)
    )
end

puts "doctors created!"

n_of_appointments.times do |index|
  Appointment.create(
    date: Faker::Date.between(from: '2024-02-23', to: '2024-09-25'),
    doctor_id: rand(1..n_of_doctors),
    patient_id: rand(1..n_of_patients),
    city_id: rand(1..n_of_cities)
  )
end

puts "appointments created!"

n_of_specialties.times do |index|
  Specialty.create(name: Faker::Cannabis.medical_use)
end

puts "specialties created!"

n_of_specialty_doctor_joins.times do |index|
  SpecialtyDoctorJoin.create(
    specialty_id: rand(1..n_of_specialties),
    doctor_id: rand(1..n_of_doctors)
  )
end

puts "specialty doctor joins created!"
