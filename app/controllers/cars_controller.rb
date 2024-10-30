class CarsController < ApplicationController
  def index
    @cars = Car.page(params[:page]).per(15)
  end

  def show
    @car = Car.find(params[:id])
  end

end
