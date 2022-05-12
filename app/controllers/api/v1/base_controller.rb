# frozen_string_literal: true

# Holds all the common methods used across the API
class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def response_success(data = {})
    if data.keys.any?
      render status: :ok, json: data
    else
      render status: :no_content, json: {}
    end
  end
end
