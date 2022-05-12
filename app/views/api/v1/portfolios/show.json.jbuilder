# frozen_string_literal: true

json.portfolio do
  json.investor_name @portfolio_details[:investor_name]
  json.profit @portfolio_details[:profit]
  json.annualized_return @portfolio_details[:annualized_return]
end
