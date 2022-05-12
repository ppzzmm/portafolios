# frozen_string_literal: false

# This model represents the stocks of the portfolio
class Stock < ApplicationRecord
  belongs_to :portfolio
end
