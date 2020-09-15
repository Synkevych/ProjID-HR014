# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#FactoryBot.create(:user, email: 'admin@gmail.com', password: 'admins', password_confirmation: 'admins')

#FactoryBot.create_list(:checklist_with_questions, 5)
5.times do 
  FactoryBot.create(:audit, checklist: Checklist.find(rand(10)+1))
end
#audit = Audit.find(1)
# FactoryBot.create(:answer, audit: audit.id, question_id: audit.checklist.questions.first.id)
