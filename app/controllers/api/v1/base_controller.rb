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

  def response_error(args = {})
    opts = { code: 403 }.merge(args)
    opts[:message] ||= t("api.http_response.errors.error_#{opts[:code]}")

    render status: opts[:code], json: {
      error: opts[:message]
    }
  end
end
