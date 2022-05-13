# frozen_string_literal: true

class Api::V1::StocksController < Api::V1::BaseController
  before_action :find_portfolio

  def show
    result = Stocks::Details.run(@portfolio, portfolio_params[:opening_date])
    return response_error message: result.error_message unless result.success?

    @stocks = result.object
  end

  private

  def find_portfolio
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :opening_date
    )
  end
end
