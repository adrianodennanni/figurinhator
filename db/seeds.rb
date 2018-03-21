# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'

csv_text = File.read("#{Rails.root}/db/seeds/figurinha_info.csv")
csv = CSV.parse(csv_text, :headers => true)
puts 'Gerando seeds de informações de figurinhas'
csv.each do |row|
  figurinha = row.to_hash
  FigurinhaInfo.where(numero: figurinha[:numero]).first_or_create(figurinha)
  print '.'
end
