class CalendarEventsController < ApplicationController
  expose(:calendar_event, attributes: :calendar_event_params)

  def create
    if params[:event][:from_date].empty?
      params[:event][:from_date] = Date.today
    end
    if params[:event][:to_date].empty?
      params[:event][:to_date] = Date.today
    end
    if params[:event][:is_all_day] == '0'
      if params[:event][:from_time].empty?
        params[:event][:from_time] = Time.now.beginning_of_day
      end
      if params[:event][:to_time].empty?
        params[:event][:to_time] = Time.now.end_of_day
      end
    end
    if calendar_event.save
      flash[:notice] = 'Event Created'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if calendar_event.save
      flash[:notice] = 'Event Updated'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    calendar_event.destroy
    redirect_to root_path
  end

  private
  def calendar_event_params
    params(:calendar_event).permit()
  end
end


