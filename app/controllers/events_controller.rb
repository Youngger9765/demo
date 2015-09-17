class EventsController < ApplicationController

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  #get events/index
  #get events
  def index
    @events = Event.all
  end

  #Get events/
  def new
    @event = Event.new
  end

  #POST events/create
  def create
    @event = Event.new(event_params)
    
    

    if @event.save
      redirect_to events_url
      flash[:notice] = "新增成功的訊息"
    else
      render :action => :new
    end
  end

  #Get events/show
  def show
    
    @page_title = @event.name
  end

  #Get events/edit
  def edit
    

  end 

  #POST events/update:id
  def update 

    if @event.update(event_params)
      redirect_to event_url(@event)
      flash[:notice] = "event was successfully updated"
    else
      render :action => :edit
    end
  end

  def destroy
    flash[:alert] = "event was successfully deleted"
  end






  private

  def set_event
    @event = Event.find( params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description)
    
  end



end
