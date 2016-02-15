class CalendarEventInstancesController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    #@calendar_event_instances = CalendarEventInstance.occurrences_between(Date.parse('1900-01-01'),Date.parse('9999-01-01'))
    if params[:calendar_ids]
      @calendar_event_instances = CalendarEventInstance.occurrences_between(Date.today - 1.year,Date.today + 1.year, params[:calendar_ids])
    else
      @calendar_event_instances = CalendarEventInstance.occurrences_between(Date.today - 1.year,Date.today + 1.year)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calendar_event_instances.to_json(:methods => [:color]) }
    end
  end
end
