# frozen_string_literal: true

require 'rails_helper'
require 'json_matchers/rspec'

RSpec.describe Api::V1::StocksController, type: :controller do
  render_views

  let(:portfolio) { create(:portfolio) }
  let!(:stock) { create(:stock, portfolio_id: portfolio.id) }

  describe '#show' do
    context 'when the params are correct' do
      it 'returns the stocks with their prices' do
        post :show, format: :json, params: { id: portfolio.id,
                                             portfolio: {
                                               opening_date: '2022/01/02'
                                             } }
        expect(response).to be_successful
        body = JSON.parse(response.body)
        expect(body['stocks'].count).to eq 1
      end
    end

    context 'when the params are not correct' do
      it 'returns an empty value' do
        post :show, format: :json, params: { id: portfolio.id,
                                             portfolio: { opening_date: nil } }
        body = JSON.parse(response.body)
        expect(body['stocks'].count).to eq 0
      end
    end
  end
end
