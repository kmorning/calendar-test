class CalendarEventsController < ApplicationController
  expose(:calendar_events){ CalendarEvent.all }
  expose(:calendar_event){
    if params[:action] == 'new'
      Event.new()
    elsif params[:action] == 'create'
      Event.new(params[:calendar_event])
    elsif params[:action] == 'show' || params[:action] == 'edit'
      Event.find(params[:id])
    end
  }
  def new
  end
  def show
  end
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: events }
    end
  end
  def create
    if params[:calendar_event][:from_date].empty?
      params[:calendar_event][:from_date] = Date.today
    end
    if params[:calendar_event][:to_date].empty?
      params[:calendar_event][:to_date] = Date.today
    end
    if params[:calendar_event][:is_all_day] == '0'
      if params[:calendar_event][:from_time].empty?
        params[:calendar_event][:from_time] = Time.now.beginning_of_day
      end
      if params[:calendar_event][:to_time].empty?
        params[:calendar_event][:to_time] = Time.now.end_of_day
      end
    end
    if event.save
      flash[:notice] = 'Event Created'
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    e = CalendarEvent.find(params[:id])
    e.update_attributes(params[:calendar_event])
    flash[:notice] = 'Event Updated'
    redirect_to root_path
  end
  def destroy
    event = CalendarEvent.find(params[:id])
    event.destroy
    redirect_to root_path
  end
end
