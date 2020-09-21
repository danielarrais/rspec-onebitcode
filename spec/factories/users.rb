FactoryBot.define do
  factory :user do
    nickname { FFaker::Name.first_name }
    kind { [:knight, :wizard].sample }
    level { FFaker::Random.rand(1..99) }
  end
end
