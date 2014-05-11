# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

json = ActiveSupport::JSON.decode(File.read('db/seeds/drugs.json'))

json.each do |a|
  Drug.create!({din: a['DRUG_IDENTIFICATION_NUMBER'], brand_name: a['BRAND_NAME']}, without_protection: true)
end
