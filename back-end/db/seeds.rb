# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Nurse.create(
    name: "Jane Foster",
    gender: "Female",
    department: "Orthopedic"
)


Doctor.create(
    name: "Dr. House",
    gender: "Male", 
    field: "Surgeon"
)

User.create(
    name: "Joe Swanson",
    email: "Joeswanson12@gmail.com",
    age: "43",
    gender: "Male",
    medical_history: "none"
)
