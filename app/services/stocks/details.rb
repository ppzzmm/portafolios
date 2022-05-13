# frozen_string_literal: true

# This class gets the details of the stocks from the portfolio
module Stocks
  class Details
    include ErrorHelper

    def initialize(portfolio, opening_date)
      @portfolio = portfolio
      @opening_date = opening_date
    end

    def self.run(portfolio, opening_date)
      new(portfolio, opening_date).run
    end

    def run
      return resolution(false, :no_portfolio) unless portfolio
      return resolution(false, :no_opening_date) unless opening_date

      resolution(true, nil, stocks)
    end

    private

    attr_reader :portfolio, :opening_date

    def stocks
      portfolio.stocks.where(opening_date: opening_date)
    end

    def errors
      {
        no_portfolio: 'The portfolio is missing',
        no_opening_date: 'The opening date is missing'
      }
    end
  end
end
