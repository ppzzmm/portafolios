# frozen_string_literal: true

require 'rails_helper'

describe Portfolios::Details do
  let(:portfolio) { create(:portfolio) }
  let!(:stock) { create(:stock, portfolio_id: portfolio.id) }

  describe '#run' do
    context 'when there is a portfolio' do
      it 'gets the details of the portfolio' do
        result = described_class.run(portfolio, { start_date: '2022/01/01',
                                                  end_date: '2022/01/02' })
        expect(result.success?).to be(true)
        expect(result.object[:profit]).to eq 10
        expect(result.object[:annualized_return]).to eq 100
      end
    end

    context 'when there is not a portfolio' do
      it 'returns an error' do
        result = described_class.run(nil, { start_date: '2022/01/01',
                                            end_date: '2022/01/02' })
        expect(result.success?).to be(false)
        expect(result.error_message).to eq 'The portfolio is missing'
      end
    end

    context 'when the start date is missing' do
      it 'returns an error' do
        result = described_class.run(portfolio, { end_date: '2022/01/02' })
        expect(result.success?).to be(false)
        expect(result.error_message).to eq 'The start date is missing'
      end
    end

    context 'when the end date is missing' do
      it 'returns an error' do
        result = described_class.run(portfolio, { start_date: '2022/01/02' })
        expect(result.success?).to be(false)
        expect(result.error_message).to eq 'The end date is missing'
      end
    end
  end
end
