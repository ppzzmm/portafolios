# frozen_string_literal: false

# This model represents the portfolios of the investor
class Portfolio < ApplicationRecord
  has_many :stocks, dependent: :destroy

  validates :investor_name, presence: true, uniqueness: true
end
