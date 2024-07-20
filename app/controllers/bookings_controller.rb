class BookingsController < ApplicationController
    def new
        @Flight = Flight.find(params[:flight])
        @count = params[:count]
        Booking.find_or_create_by({flight_id:@Flight.id,count: @count})
    end
end