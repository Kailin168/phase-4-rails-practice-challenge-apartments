class TenantsController < ApplicationController
  before_action :find_tenant, only: [:show, :update, :destroy]

def index
  render json: Tenant.all
end

def show
  if @tenant
    render json: @tenant, status: 200
  else 
    render json: { error: "no tenant, no no no" }, status: 404
  end
end

def create
  render json: Tenant.create!(tenant_params), status: 202
end

def update
  if @tenant
    @tenant.update!(app_params)
    render json: @tenant, status: 200
  else 
    render json: { error: "no tenant, no no no" }, status: 404
  end
end

def destroy
  if @tenant
    @tenant.destroy
    render json: @tenant
  else 
    render json: { error: "no tenant, no no no" }, status: 404
  end
end


private

def find_tenant
  @tenant = Tenant.find_by(id: params[:id])
end

def tenant_params
  params.permit(:name, :age)
end


end
