class AssignedTaxCodesController < ApplicationController


    def index
        @company = Company.find(params[:company_id])
        @entities = @company.entities.order("name asc")
        @entity_assigned_tax_codes = {}
        @entities.each do |entity|
            @entity_assigned_tax_codes[entity] = entity.assigned_tax_codes
        end
    end

    def new
        @company = Company.find(params[:company_id])
        @assigned_tax_codes = AssignedTaxCode.new
        @entities = @company.entities.order("name asc")
        @entities_name = []
        @entities.each do |entity|
            @entities_name << entity.name + " | " + entity.jurisdiction
        end
    end

    def create
        entity_name = params_assigned_tax_code[:entity_id].split("|")[0].strip
        entity_jurisdiction = params_assigned_tax_code[:entity_id].split("|")[1].strip
        @entity = Entity.where(name: entity_name, jurisdiction: entity_jurisdiction)[0]
        @assigned_tax_codes = AssignedTaxCode.new(name: params_assigned_tax_code[:name], side: params_assigned_tax_code[:side], localization: params_assigned_tax_code[:localization], rate: params_assigned_tax_code[:rate], type_transaction: params_assigned_tax_code[:type_transaction])
        @assigned_tax_codes.entity = @entity
        if @assigned_tax_codes.save
            redirect_to company_assigned_tax_codes_path(current_user.company)
        else
            render :new
        end
    end

    def edit
        @company = Company.find(params[:company_id])
        @assigned_tax_code = AssignedTaxCode.find(params[:id])
        
    end

    def update
        @assigned_tax_code = AssignedTaxCode.find(params[:id])
        @assigned_tax_code = @assigned_tax_code.update(name: params_assigned_tax_code[:name], side: params_assigned_tax_code[:side], localization: params_assigned_tax_code[:localization], rate: params_assigned_tax_code[:rate], type_transaction: params_assigned_tax_code[:type_transaction])
        redirect_to company_assigned_tax_codes_path(current_user.company)
    end

    def destroy
        @assigned_tax_codes = AssignedTaxCode.find(params[:id])
        @assigned_tax_codes.destroy
        redirect_to company_assigned_tax_codes_path(current_user.company)   
    end

    private
    
    def params_assigned_tax_code
        params.require(:assigned_tax_code).permit(:entity_id, :name, :side, :localization, :rate, :type_transaction)
    end
end