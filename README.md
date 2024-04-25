## RECUPERER UNE LISTE DE PATIENT POUR UN DOCTEUR: 
patients_list = Doctor.find(doctor_id).patients
patients_list.each do |patient|
  puts "Nom du patient: #{patient.first_name} #{patient.last_name}"
end
