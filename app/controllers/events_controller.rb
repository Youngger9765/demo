class EventsController < ApplicationController

  before_action :set_event, :only => [ :show, :edit, :update, :destroy]

  #get events/index
  #get events
  def index
    @events = Event.order("id DESC").page(params[:page]).per(5)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @events.to_xml }
      format.json { render :json => @events.to_json }
      format.atom { @feed_title = "My event list" } # index.atom.builder
    end

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

    respond_to do |format|
      format.html { @page_title = @event.name } # show.html.erb
      format.xml # show.xml.builder
      format.json { render :json => { id: @event.id, name: @event.name }.to_json }
    end

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
    @event.destroy
    flash[:alert] = "event was successfully deleted"
    redirect_to events_url
  end






  private

  def set_event
    @event = Event.find( params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :category_id)
    
  end



end
