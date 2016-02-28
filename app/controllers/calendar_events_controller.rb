class CalendarEventsController < ApplicationController
  expose(:calendar_events){ CalendarEvent.all }
  expose(:calendar_event, attributes: :calendar_event_params)#{
#    if params[:action] == 'new'
#      CalendarEvent.new()
#    elsif params[:action] == 'create'
#      CalendarEvent.new(params[:calendar_event])
#    elsif params[:action] == 'show' || params[:action] == 'edit'
#      CalendarEvent.find(params[:id])
#    end
#  }
#  def new
#  end
#  def show
#  end
#  def index

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: events }
#    end
#  end
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
    if calendar_event.save
      flash[:notice] = 'Event Created'
      redirect_to root_path
    else
      render :new
    end
  end
  def update
    #e = CalendarEvent.find(params[:id])
    #e.update_attributes(params[:calendar_event])
    if calendar_event.save
      flash[:notice] = 'Event Updated'
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    #calendar_event = CalendarEvent.find(params[:id])
    calendar_event.destroy
    redirect_to calendar_events_path
  end

  private
  def calendar_event_params
    params.require(:calendar_event).permit(:from_date, :from_time, :to_date,
                                            :to_time, :is_all_day, :repeat_ends,
                                            :repeat_ends_on, :repeats,
                                            :repeats_every_n_days,
                                            :repeats_every_n_weeks,
                                            {repeats_weekly_each_days_of_the_week: []},
                                            :repeats_every_n_months,
                                            :repeats_monthly,
                                            :repeats_monthly_each_days_of_the_month,
                                            :repeats_monthly_on_days_of_the_week,
                                            :repeats_monthly_on_ordinals,
                                            :repeats_every_n_years,
                                            :repeats_yearly_each_months_of_the_year,
                                            :repeats_yearly_on,
                                            :repeats_yearly_on_days_of_the_week,
                                            :repeats_yearly_on_ordinals,
                                            :name, :description, :calendar_id)
  end
end
