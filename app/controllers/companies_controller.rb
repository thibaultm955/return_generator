class CompaniesController < ApplicationController
    def show
        @company = Company.find(current_user.company_id)
        @entities = @company.entities.order('name ASC')
    end

    def new
        @company = Company.new
    end

    def create
        @company = Company.new(params_company)
        @user = current_user
        if @company.save
            @user.company = @company
            @user.save
            redirect_to company_path(@company.id)
        else
            render :new
        end
    end

    # Attention, Destroy used to remove entities from company show screen
    def destroy
        @company = Company.find(current_user.company_id)
        @entity = Entity.find(params[:id])
        @entity.delete
        redirect_to company_path(@company.id)
    end

    private

    def params_company
        params.require(:company).permit(:name, :adress, :postal_code, :city, :jurisdiction)
    end
end