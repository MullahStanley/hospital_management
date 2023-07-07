require 'faker'

phone_number = Faker::PhoneNumber.phone_number_with_country_code

genders = ['Male', 'Female']
random_gender = genders.sample

puts 'Seeding nurses:'
6.times do
  Nurse.create!(
    [
      {
        name: Faker::Name.name,
        phone: phone_number,
        gender: random_gender
      },
    ],
  )
end
puts 'Seeding doctors'
5.times do
  Doctor.create!(
    [
      {
        name: Faker::Name.name,
        gender: random_gender,
        speciality: [
          'Dermatology',
          'Cardiology',
          'Family Medicine',
          'General Surgery',
          'Hematology',
          'Ophthalmology',
          'Psychiatry',
        ].sample,
        phone: phone_number,
        location: Faker::Address.full_address
      },
    ],
  )
end
puts 'Seeding patients...'
20.times do
  Patient.create!(
    [
      {
        name: Faker::Name.name,
        gender: random_gender,
        email: Faker::Internet.email,
        condition: [
          'Bacterial vaginosis',
          'Acne',
          'Depression',
          'Allergies',
          'Malaria',
        ].sample,
        nurse_id: rand(1..6),
        password: Faker::Internet.password(min_length: 8, max_length: 10)
      },
    ],
  )
end
puts 'Seeding Appointments...'
10.times do
  Appointment.create!(
    [
      {
        patient_id: rand(1...10),
        doctor_id: rand(1...5),
        date: Faker::Date.forward(days: 23),
        duration: "#{rand(10...30)} minutes",
        appointment_type: [
          'Routine Care',
          'Follow-Up',
          'Urgent Visit',
          'Consultation',
        ].sample,
      },
    ],
  )
end