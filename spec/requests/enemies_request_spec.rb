require 'rails_helper'

RSpec.describe "Enemies", type: :request do
  let(:enemy) { create(:enemy) }
  let(:enemy_attributes) { attributes_for(:enemy) }

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
