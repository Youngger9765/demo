class EventAttendeesController < ApplicationController
  
  before_action :set_event
  def index
  	@attendees = @event.attendees
  

  end

  def show
  	@attendee = @event.attendees.find( params[:id] )

  	
  end

  def new
  	@attendee = @event.attendees.build
  	
  end


  def create
  	@attendee = @event.attendees.build( attendee_params)

  	if @attendee.save
  		redirect_to event_attendees_path(@event)
  	else
  		render :action => "new"
  	end
  end

  def edit
  	@attendee = @event.attendees.find( params[:id] )
  end

  def update
  	@attendee = @event.attendees.find( params[:id] )
  	
  	if @attendee.update( attendee_params )
  		redirect_to event_attendees_path(@event)
  	else
  		render :action => "edit"
  	end

  end

  def destroy
  	#要先找到刪除的是哪一筆
  	@attendee = @event.attendees.find( params[:id] )
  	#執行刪除
  	@attendee.destroy

  	redirect_to event_attendees_path(@event)
  end


  protected

#在attendees 的目錄下，每一筆都需要對照event_id
  def set_event
  	@event = Event.find( params[:event_id] )  #event_id 是attendee 的foreign key
  end

  def attendee_params
  	params.require(:attendee).permit(:name)
  end


end
