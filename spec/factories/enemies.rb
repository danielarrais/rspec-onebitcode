FactoryBot.define do
  factory :enemy do
    name { FFaker::Name.first_name }
    power_base { FFaker::Random.rand(1000..3000) }
    power_step { FFaker::Random.rand(100..1000) }
    level { FFaker::Random.rand(1..999) }
    kind { %w[goblin orc demon dragon].sample }
  end
  factory :invalid_enemy, class: Enemy do
    name { '' }
    power_base { '' }
    power_step { '' }
    level { '' }
    kind { '' }
  end
end
