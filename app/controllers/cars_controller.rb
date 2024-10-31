class CarsController < ApplicationController
  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @cars = Car.where("LOWER(brand) LIKE ? OR LOWER(model) LIKE ?", query, query).page(params[:page]).per(15)
    else
      @cars = Car.page(params[:page]).per(15)
    end
  end

  def show
    @car = Car.find(params[:id])
  end
end
