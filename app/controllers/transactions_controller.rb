class TransactionsController < ApplicationController
    def new
        @declaration = Declaration.find(params[:declaration_id])
        @entity = @declaration.entity
        @company = @entity.company
        @transaction = Transaction.new
        @assigned_tax_codes = AssignedTaxCode.where(entity_id: @entity.id)
        @tax_codes_names = []
        @assigned_tax_codes.each {|tax_code| @tax_codes_names << tax_code.name}
        
    end

    def create
        @declaration = Declaration.find(params[:declaration_id])
        @company = current_user.company
        @assigned_tax_code =  AssignedTaxCode.find(params_transaction[:assigned_tax_code_id])
        @transaction = Transaction.new(business_partner_name: params_transaction[:business_partner_name], business_partner_vat_number: params_transaction[:business_partner_vat_number], transaction_date: params_transaction[:transaction_date], gross_amount: params_transaction[:gross_amount], net_amount: params_transaction[:net_amount], vat_amount: params_transaction[:vat_amount])
        @transaction.declaration = @declaration
        @transaction.assigned_tax_code = @assigned_tax_code
        if @transaction.save
            redirect_to company_declaration_path(@company, @declaration)
        else
            render :new
        end
    end

    def show
        # if user click on delete, the url will contain .delete and you can retrieve it from the params[:format]. As the delete button is in declaration
        # index, need to use href (cannot use button_to)
        if params[:format] == "delete"
            @declaration = Declaration.find(params[:declaration_id])
            @company = current_user.company
            @transaction = Transaction.find(params[:id])
            @transaction.destroy
            redirect_to company_declaration_path(@company, @declaration)
        else

        end
    end

    def edit
        @declaration = Declaration.find(params[:declaration_id])
        @entity = @declaration.entity
        @company = @entity.company
        @transaction = Transaction.find(params[:id])
        @assigned_tax_codes = AssignedTaxCode.where(entity_id: @entity.id)
        @tax_codes_names = []
        @assigned_tax_codes.each {|tax_code| @tax_codes_names << tax_code.name}
    end

    def update
        @transaction = Transaction.find(params[:id])
        @assigned_tax_code =  AssignedTaxCode.find(params_transaction[:assigned_tax_code_id])
        @transaction.assigned_tax_code = @assigned_tax_code
        @transaction.update(business_partner_name: params_transaction[:business_partner_name], business_partner_vat_number: params_transaction[:business_partner_vat_number], transaction_date: params_transaction[:transaction_date], gross_amount: params_transaction[:gross_amount], net_amount: params_transaction[:net_amount], vat_amount: params_transaction[:vat_amount])
        @declaration = Declaration.find(params[:declaration_id])
        @company = current_user.company
        redirect_to company_declaration_path(@company, @declaration)
    end

    private

    def params_transaction
        params.require(:transaction).permit(:assigned_tax_code_id, :business_partner_name, :business_partner_vat_number, :transaction_date, :gross_amount, :net_amount, :vat_amount)
    end
end