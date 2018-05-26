# encoding: UTF-8

class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @events = Event.where(user_id: session[:user_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new
    params = event_params
    @event.assign_attributes({
      user_id: session[:user_id],
      name: params[:name],
      address: params[:address],
      number: params[:number],
      zip_code: params[:zip_code],
      description: params[:description],
      image: params[:image],
      date: params[:date],
      initial_time: params[:initial_time],
      final_time: params[:final_time],
      price: params[:price]
    })

    @event.save!
    redirect_to root_url
  end

  def search
    @events = Event.search_events(params[:search])
  end

  private
    def event_params
      params.require(:event).permit(
        :name,
        :address,
        :number,
        :zip_code,
        :address,
        :description,
        :image,
        :date,
        :initial_time,
        :final_time,
        :price
      )
    end
end
