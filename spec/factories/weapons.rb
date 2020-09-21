require 'ffaker'

FactoryBot.define do
  factory :weapon do
    name { FFaker::Name.first_name }
    description { FFaker::Lorem.paragraph }
    power_base { FFaker::Random.rand(1000..3000) }
    power_step { FFaker::Random.rand(100..1000) }
    level { FFaker::Random.rand(1..999) }
  end
end
