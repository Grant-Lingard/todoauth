FactoryBot.define do
   factory :user do |f|
      f.sequence(:name) { |n| "Test User #{n}" }
      f.sequence(:email) { |n| "test#{n}@example.com" }
      f.password "password"
      f.password_confirmation { |d| d.password }
   end
   factory :reminder do |f|
      f.sequence(:name) { |n| "Reminder #{n}" }
      f.priority 1
      f.association :user
   end
end