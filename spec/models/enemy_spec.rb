require 'rails_helper'

RSpec.describe Enemy, type: :model do
  it 'returns correct current_power value of the weapon' do
    enemy = build(:enemy)
    current_power = enemy.power_base + ((enemy.level - 1) * enemy.power_step)

    expect(enemy.current_power).to eq(current_power)
  end
end
