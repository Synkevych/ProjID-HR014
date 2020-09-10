require 'faker'

FactoryBot.define do
  factory :checklist do
    title { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    description { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    publish { false }
    
    factory :published_checklist do
      public { true }
    end
    
  end
end
