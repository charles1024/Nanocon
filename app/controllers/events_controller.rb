class EventsController < ApplicationController
  def new
  end

  def create
    @event = Event.new(params[:event].permit(:name, :description))

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @event = Event.all
  end

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end
end
