class FlightsController < ApplicationController
    before_action :find_flights
    def index
        @flights = Flight.all
        if(!params[:departure].nil?)
            @departure_airports = Airport.where(id: params[:departure])
            @departureIsSet = true
        end
        if(!params[:departure].nil? && (params[:arrival] == "" || params[:arrival].nil?) )
            @arrival_airports=Flight.where(departure_airport_id: params[:departure]).collect{|f|f.arrival_airport}.uniq
        end
        if(!(params[:arrival] == "" || params[:arrival].nil?))
            @arrival_airports = Airport.where(id: params[:arrival])
            @arrivalIsSet = true
        end
        @dates=Flight.where(departure_airport_id: params[:departure]).where(arrival_airport_id: params[:arrival]).pluck(:departure_time).uniq || []
        @searchedFlights = Flight.where(departure_airport_id: params[:departure]).where(arrival_airport_id: params[:arrival])
        @count = params[:passenger]
    end

    def new
        @flight =Flight.new
    end
    
    def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    def find_flights
        @departure_airports = Flight.all.collect{|f| f.departure_airport}.uniq
        @departureIsSet = false
        @arrival_airports=Flight.where(departure_airport_id: params[:departure]).collect{|f|f.arrival_airport}.uniq
        @arrivalIsSet = false
    end
    def flight_params
      params.fetch(:flight).permit(:model,:capacity,:arrival_airport_id,:departure_airport_id,:departure_time,:arrival_time)
    end
end
