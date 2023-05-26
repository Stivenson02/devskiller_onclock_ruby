# frozen_string_literal: true

class ReportsController < ApplicationController
  def get
    unless validate_params?
      render :json => { :errors => "validate" }, :status => 400
    end
    get_filter
    get_problems
    @total_hours = 0.0
    get_working_hrs

    render :json => {
      employee_id: params[:employee_id].to_i,
      from: params[:from], to: params[:to],
      working_hrs: @total_hours.round(2),
      problematic_dates: @problematic_dates
    }, :status => 200

  end

  def validate_params?
    report = Report.new
    report.employee_id = params[:employee_id]
    report.from = params[:from]
    report.to = params[:to]
    report.valid?
  end

  private

  def get_filter
    @filter_event = Event.where(timestamp: ("#{params[:from]} 01:00".."#{params[:to]} 23:59"), employee_id: params[:employee_id].to_i)
                         .map { |x| { date: x.timestamp.to_date, kind: x.kind, time: x.timestamp } }
                         .group_by { |td| td[:date] }
  end

  def get_problems
    @problematic_dates = []
    @filter_event.each do |filter|
      there_in = filter[1].any? { |x| x[:kind] == "in" }
      there_out = filter[1].any? { |x| x[:kind] == "out" }

      if !there_in || !there_out
        @problematic_dates << filter[0].strftime("%Y-%m-%d")
      end
    end
  end

  def get_working_hrs
    @filter_event.each do |filter|
      order = filter[1].sort_by { |c| c[:time] }
      init_work = order.first[:time]
      end_work = order.last[:time]
      @total_hours += ((end_work.time - init_work) / 3600)
    end
    @total_hours
  end

end
