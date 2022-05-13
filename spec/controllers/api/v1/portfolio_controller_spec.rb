# frozen_string_literal: true

require 'rails_helper'
require 'json_matchers/rspec'

RSpec.describe Api::V1::PortfoliosController, type: :controller do
  render_views

  let(:portfolio) { create(:portfolio) }
  let!(:stock) { create(:stock, portfolio_id: portfolio.id) }

  describe '#show' do
    context 'when the params are correct' do
      it 'returns the details of the portfolio' do
        post :show, format: :json, params: { id: portfolio.id,
                                             portfolio: {
                                               start_date: '2022/01/01',
                                               end_date: '2022/01/02'
                                             } }
        expect(response).to be_successful
        body = JSON.parse(response.body)
        expect(body['portfolio']['profit']).to eq 10
      end
    end

    context 'when the params are not correct' do
      it 'returns an error' do
        post :show, format: :json, params: { id: portfolio.id,
                                             portfolio: { end_date: '2022/01/02' } }
        expect(response).not_to be_successful
      end
    end
  end
end
