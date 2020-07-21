class DeclarationsController < ApplicationController
    def index
        @entities = Company.find(current_user.company_id).entities
        @declarations = Declaration.where(entity_id: @entities.ids)
    end

    def new
        @declaration = Declaration.new
    end
end