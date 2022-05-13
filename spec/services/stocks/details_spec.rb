# frozen_string_literal: true

require 'rails_helper'

describe Stocks::Details do
  let(:portfolio) { create(:portfolio) }
  let!(:stock) { create(:stock, portfolio_id: portfolio.id) }

  describe '#run' do
    context 'when there is a portfolio' do
      it 'gets the details of the portfolio' do
        result = described_class.run(portfolio, '2022/01/02')
        expect(result.success?).to be(true)
        expect(result.object.count).to eq 1
      end
    end

    context 'when there is not a portfolio' do
      it 'returns an error' do
        result = described_class.run(nil, opening_date: '2022/01/01')
        expect(result.success?).to be(false)
        expect(result.error_message).to eq 'The portfolio is missing'
      end
    end

    context 'when the start date is missing' do
      it 'returns an error' do
        result = described_class.run(portfolio, nil)
        expect(result.success?).to be(false)
        expect(result.error_message).to eq 'The opening date is missing'
      end
    end
  end
end
