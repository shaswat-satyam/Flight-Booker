class PassengersController < ApplicationController
    def new
        
        @passengers = CGI.parse(URI.parse(request.fullpath).query)
        @passengers["name"].length.times do |i|
            Passenger.find_or_create_by({name:@passengers["name"][i], email:@passengers["email"][i]})
            PassengerMailer.welcome_email(Passenger.new(name:@passengers["name"][i], email:@passengers["email"][i])).deliver_now
        end

    end
    def index
    end
end