require 'rails_helper'

RSpec.describe "Weapons", type: :request do

  describe "GET /index" do
    it "Whether the name, current_power, titles and links is being displayed" do
      weapons = create_list(:weapon, 5)
      get weapons_path

      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
        expect(response.body).to include(weapon.current_power.to_s)
        expect(response.body).to include(weapon.title)
        expect(response.body).to include(weapon_path(weapon))
      end
    end
  end

  describe "GET /create" do
    context 'when it has valid parameters' do
      it 'Creates the weapon with correct attributes' do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_path, params: { weapon: weapon_attributes }

        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end

    context 'when it has no valid parameters' do
      it 'Does not create weapon' do
        expect {
          post weapons_path, params: { weapon: { name: '', description: '', power_base: '', power_step: '', level: '' } }
        }.to_not change(Weapon, :count)
      end
    end
  end

  describe "GET /delete" do
    it "Delete by passing the correct id" do
      weapon = create(:weapon)
      delete weapon_path(weapon)

      expect(Weapon.find_by_id(weapon.id)).to be_nil
    end
  end

  describe "GET /show" do
    it "Whether all attributes have been displayed on the screen" do
      weapon = create(:weapon)

      get weapon_path(weapon)

      expect(response.body).to include(weapon.name)
      expect(response.body).to include(weapon.description)
      expect(response.body).to include(weapon.power_base.to_s)
      expect(response.body).to include(weapon.power_step.to_s)
      expect(response.body).to include(weapon.current_power.to_s)
      expect(response.body).to include(weapon.level.to_s)
      expect(response.body).to include(weapon.title)
    end
  end

end
