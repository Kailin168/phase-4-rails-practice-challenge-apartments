class ApartmentsController < ApplicationController
  before_action :find_apartment, only: [:show, :update, :destroy]

def index
  render json: Apartment.all
end

def show
  if @apartment
    render json: @apartment, status: 200
  else 
    render json: { error: "no apartment, no no no" }, status: 404
  end
end

def create
  render json: Apartment.create!(app_params), status: 202
end

def update
  if @apartment
    @apartment.update!(app_params)
    render json: @apartment, status: 200
  else 
    render json: { error: "no apartment, no no no" }, status: 404
  end
end

def destroy
  if @apartment
    @apartment.destroy
  else 
    render json: { error: "no apartment, no no no" }, status: 404
  end
end


private

def find_apartment
  @apartment = Apartment.find_by(id: params[:id])
end

def app_params
  params.permit(:number)
end


  
end
