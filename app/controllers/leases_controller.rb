class LeasesController < ApplicationController
  before_action :find_lease, only: [:destroy]

  def create
    render json: Lease.create!(lease_params), status: 202
  end

  def destroy
    if @lease
      @lease.destroy
    else 
      render json: { error: "no lease, no no no" }, status: 404
    end
  end
  
  private

  def find_lease
    @lease = Lease.find_by(id: params[:id])
  end
  
  def lease_params
    params.permit(:apartment_id, :tenant_id, :rent)
  end


end
