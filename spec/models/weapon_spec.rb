require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it 'returns correct current_power value of the weapon' do
    weapon = build(:weapon)
    current_power = weapon.power_base + ((weapon.level - 1) * weapon.power_step)

    expect(weapon.current_power).to eq(current_power)
  end

  it 'returns correct title value of the weapon' do
    weapon = build(:weapon)
    title = "#{weapon.name} ##{weapon.level}"

    expect(weapon.title).to eq(title)
  end
end
