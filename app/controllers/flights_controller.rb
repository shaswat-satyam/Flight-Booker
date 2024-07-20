class FlightsController < ApplicationController
    before_action :find_flights
    def index
        @flights = Flight.all
        if(!params[:departure].nil?)
            @departure_airports = Airport.where(id: params[:departure])
            @departureIsSet = true
        end
        if(!params[:departure].nil? && params[:arrival] == "" )
            @arrival_airports=Flight.where(departure_airport_id: params[:departure]).collect{|f|f.arrival_airport}.uniq
        end
        if(!(params[:arrival] == ""))
            @arrival_airports = Airport.where(id: params[:arrival])
            @arrivalIsSet = true
        end
        @dates=Flight.where(departure_airport_id: params[:departure]).where(arrival_airport_id: params[:arrival]).uniq || []
        @searchedFlights = Flight.where(departure_airport_id: params[:departure]).where(arrival_airport_id: params[:arrival])
        @count = params[:passenger]
    end
    private
    def find_flights
        @departure_airports = Flight.all.collect{|f| f.departure_airport}.uniq
        @departureIsSet = false
        @arrival_airports=Flight.where(departure_airport_id: params[:departure]).collect{|f|f.arrival_airport}.uniq
        @arrivalIsSet = false
    end
end
