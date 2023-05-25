# frozen_string_literal: true

class ReportsController < ApplicationController
  def get
    unless validate_params?
      render :json => { :errors => "validate" }, :status => 400
    end
  end

  def validate_params?
    report = Report.new
    report.employee_id = params[:employee_id]
    report.from = params[:from]
    report.to = params[:to]
    report.valid?
  end
end
