# frozen_string_literal: true

json.stocks @stocks do |stock|
  json.company stock.company
  json.price stock.price
end
