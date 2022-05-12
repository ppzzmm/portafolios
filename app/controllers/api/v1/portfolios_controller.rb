# frozen_string_literal: true

class Api::V1::PortfoliosController < Api::V1::BaseController
  before_action :find_portfolio

  def show
    result = Portfolios::Details.run(@portfolio, portfolio_params)
    return response_error message: result.error_message unless result.success?

    @portfolio_details = result.object
  end

  private

  def find_portfolio
    @portfolio = Portfolio.find_by(id: params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(
      :start_date,
      :end_date
    )
  end
end
