class TaxCode < ApplicationRecord
    has_many :assigned_tax_codes
    has_many :transactions
    has_many :declaration_checks, through: :transactions
end
