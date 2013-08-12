class EventsController < ApplicationController
  before_filter :find_event, :only => [ :show, :edit, :update, :destroy]


  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_url
    else
      render :action => :new
    end
    flash[:notice] = "event was successfully created"
  end
  
  def show
    @page_title = @event.name
  end
  


  def edit

  end


  def update
    if @event.update_attributes(params[:event])
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
    flash[:notice] = "event was successfully updated"
  end
  

  def destroy
    @event.destroy
    redirect_to events_url
    flash[:alert] = "event was successfully deleted"
  end


  protected

  def find_event
    @event = Event.find(params[:id])
  end


end
