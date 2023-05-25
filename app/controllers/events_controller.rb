# frozen_string_literal: true

class EventsController < ApplicationController
  def save
    begin
      @event = Event.new(event_params)
      @event.save!
    rescue => e
      error_output = "There was a problem in the JSON you submitted: #{e.to_s}"
      return [
        400, { "Content-Type" => "application/json" },
        [{ status: 400, error: error_output }.to_json]
      ]
    end
    [
      200, { "Content-Type" => "application/json" },
      [{ status: 200, data: @event }.to_json]
    ]
  end

  def event_params
    params.permit(:employee_id, :timestamp, :kind)
  end
end
