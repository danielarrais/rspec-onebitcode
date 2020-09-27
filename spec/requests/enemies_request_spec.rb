require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  describe "PUT /enemies" do
    context 'when enemies exists' do
      it 'returns status code 200' do
        enemy = create(:enemy)
        enemy_atributes = attributes_for(:enemy)

        put enemy_path(enemy), params: { enemy: enemy_atributes }

        expect(response).to have_http_status(200)
      end

      it 'updates the record' do
        enemy = create(:enemy)
        enemy_atributes = attributes_for(:enemy)

        put enemy_path(enemy), params: { enemy: enemy_atributes }

        expect(enemy.reload).to have_attributes(enemy_atributes)
      end

      it 'returns the enemy updated' do
        enemy = create(:enemy)
        enemy_atributes = attributes_for(:enemy)

        put enemy_path(enemy), params: { enemy: enemy_atributes }

        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end
    context 'when the enemy does not exists' do
      it 'return status code 404' do
        put enemy_path(id: 0), params: { enemy: attributes_for(:enemy) }
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        put enemy_path(id: 0), params: { enemy: attributes_for(:enemy) }
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe "DELETE /destroy" do
    context 'when enemy exists' do
      it 'returns status code 200' do
        enemy = create(:enemy)
        delete enemy_path(enemy)

        expect(response).to have_http_status(204)
      end

      it 'destroy the record' do
        enemy = create(:enemy)
        delete enemy_path(enemy)

        # expect(Enemy.find_by_id(enemy.id)).to be_nil
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
