class BookingsController < ApplicationController
    before_action :set_booking, only: %i[show edit update destroy]
    before_action :authenticate_user!
    def index
        @bookings = Booking.all
    end
    def show
    end
    def new
        @booking = Booking.new
    end
    def create
        @booking = Booking.new(booking_params)
        respond_to do |format|
            if @booking.save
                format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end
    def destroy
        @booking.destroy
        respond_to do |format|
            format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
        end
    end
    def update
        respond_to do |format|
            if @booking.update(booking_params)
                format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully updated.' }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end
    def edit
    end
    
    private
    def booking_params
        params.require(:booking).permit(:start, :end, :purpose, :room_id, :user_id)
    end
    private
    def set_booking
        @booking = Booking.find(params[:id])
    end
end
