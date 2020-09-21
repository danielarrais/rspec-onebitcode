require 'rails_helper'
require 'ffaker'
require 'user'

RSpec.describe User, type: :model do
  it 'is invalid if level is not between 1 and 99' do
    nickname = FFaker::Name.first_name
    kind = [:knight, :wizard].sample
    level = FFaker::Random.rand(100..9999)

    user =  User.create(nickname: nickname, kind: kind, level: level)
    expect(user).to_not be_valid
  end

  it 'returns the correct hero title' do
    nickname = FFaker::Name.first_name
    kind = [:knight, :wizard].sample
    level = FFaker::Random.rand(1..99)

    user =  User.create(nickname: nickname, kind: kind, level: level)
    expect(user.title).to eq("#{kind} #{nickname} ##{level}")
  end
end
