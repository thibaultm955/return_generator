class EntitiesController < ApplicationController

    def new
        @company = Company.find(params[:company_id])
        @entity = Entity.new
    end

    def create
        @company = Company.find(params[:company_id])
        @entity = Entity.new(entity_params)
        @entity.company = @company
        if @entity.save
            redirect_to company_path(@company.id)
        else
            render :new
        end
    end

    def edit
        @company = Company.find(params[:company_id])
        @entity = Entity.find(params[:id])
    end

    def update
        @company = Company.find(params[:company_id])
        @entity = Entity.find(params[:id])
        @entity.update(entity_params)
        redirect_to company_path(@company.id)
    end

    def destroy
        @company = Company.find(current_user.company_id)
        @entity = Entity.find(params[:id])
        redirect_to company_path(@company.id)
    end

    private

    def entity_params
        params.require(:entity).permit(:name, :adress, :postal_code, :city, :vat_number, :jurisdiction)
    end
end