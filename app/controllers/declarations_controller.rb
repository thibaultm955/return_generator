class DeclarationsController < ApplicationController
    def index
        @entities = Company.find(current_user.company_id).entities
        @declarations = Declaration.where()
    end
end