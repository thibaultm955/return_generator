class TaxCodesController < ApplicationController

    def index
        @company = Company.find(params[:company_id])
        @entities = @company.entities
        @entity_assigned_tax_codes = {}
        @entities.each do |entity|
            @entity_assigned_tax_codes[entity] = entity.assigned_tax_codes
        end
    end

    def new
        @company = Company.find(params[:company_id])
        @entities = @company.entities
        @entity = @entities[0]
        @entities_name = []
        @entities.each do |entity|
            @entities_name << entity.name + " | " + entity.jurisdiction
        end
        @tax_code = TaxCode.new
    end

    def create
        hjk
    end

end