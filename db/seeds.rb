# frozen_string_literal: true

User.new(email: 'usuariodeprueba@dominio.com', password: '123456789').save

100.times do
  User.create(
    email: Faker::Internet.unique.email,
    password: '123456789'
  )
end
