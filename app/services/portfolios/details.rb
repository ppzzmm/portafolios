# frozen_string_literal: true

# This class gets the details of the profit and annualized from the portfolio
# and its stocks on base a period of dates
module Portfolios
  class Details
    include ErrorHelper

    def initialize(portfolio, params)
      @portfolio = portfolio
      @start_date = params[:start_date]
      @end_date = params[:end_date]
    end

    def self.run(portfolio, params)
      new(portfolio, params).run
    end

    def run
      return resolution(false, :no_portfolio) unless portfolio
      return resolution(false, :no_start_date) unless start_date
      return resolution(false, :no_end_date) unless end_date

      resolution(true, nil, details)
    end

    private

    attr_reader :portfolio, :start_date, :end_date

    def details
      {
        investor_name: portfolio.investor_name,
        profit: stocks.sum(:profit),
        annualized_return: annualized_return
      }
    end

    def annualized_return
      0
    end

    def stocks
      @stocks ||= portfolio.stocks.where(opening_date: start_date..end_date)
    end

    def errors
      {
        no_portfolio: 'The portfolio is missing',
        no_start_date: 'The start date is missing',
        no_end_date: 'The end date is missing'
      }
    end
  end
end
