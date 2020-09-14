FactoryBot.create(:user, email: 'admin@gmail.com', password: 'admins', password_confirmation: 'admins')

FactoryBot.create_list(:checklist_with_questions, 5)
FactoryBot.create(:audit, checklist: Checklist.find(1))
audit = Audit.find(1)
