require 'faker'

FactoryBot.define do
  factory :checklist do
    title { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    description { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    publish { false }
    
    factory :published_checklist do
      public { true }
    end
    
    factory :checklist_with_questions do
      transient do
        questions_count { 5 }
      end
      after(:create) do |checklist, evaluator|
        create_list(:question, evaluator.questions_count, checklist: checklist)
      end
    end
  end
end
