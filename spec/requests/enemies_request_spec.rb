require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  let(:enemy) { create(:enemy) }
  let(:enemy_attributes) { attributes_for(:enemy) }
  let(:invalid_enemy_attributes) { attributes_for(:invalid_enemy) }

  describe "GET /enemies" do
    it "If the same quantity is coming" do
      enemies = create_list(:enemy, 5)
      get enemies_path

      expect(enemies.size).to eq(json.size)
    end
  end

  describe "GET /enemy" do
    context 'when enemies exists' do
      before(:each) do
        get enemy_path(enemy)
      end

      it 'return status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'return attributes the record' do
        expect(enemy).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context 'when the enemy does not exists' do
      before(:each) do
        get enemy_path(id: 0)
      end

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe "POST /enemies" do
    context 'when it has valid parameters' do
      it 'Creates the weapon with correct attributes' do
        post enemies_path, params: { enemy: enemy_attributes }
        expect(Enemy.last).to have_attributes(enemy_attributes)
      end
    end

    context 'when it has no valid parameters' do
      it 'Does not create weapon' do
        expect {
          post enemies_path, params: { enemy: invalid_enemy_attributes }
        }.to_not change(Enemy, :count)
      end
    end
  end

  describe "PUT /enemies" do
    context 'when enemies exists' do
      before(:each) do
        put enemy_path(enemy), params: { enemy: enemy_attributes }
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'updates the record' do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end

      it 'returns the enemy updated' do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context 'when the enemy does not exists' do
      before(:each) do
        put enemy_path(id: 0), params: { enemy: attributes_for(:enemy) }
      end

      it 'return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe "DELETE /destroy" do
    context 'when enemy exists' do
      before(:each) do
        delete enemy_path(enemy)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(204)
      end

      it 'destroy the record' do
        expect { enemy.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when the enemy not exit' do
      it 'returns status code 404' do
        delete enemy_path(id: 0)

        expect(response).to have_http_status(404)
      end
    end
  end
end
