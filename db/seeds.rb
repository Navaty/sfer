# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
t = Tcategory.create!(title: "Sample", description: "test")
10.times do |i|
	t.tests.create!(title:"Sample #{i}", description: "Test #{i}", questions_attributes: 
		[body: "Какой то вопрос", answers_attributes: [{body:"Rigth", isCorrect: true}, {body:"Not rigth", isCorrect: false}]])
end