class Transaction < ApplicationRecord
    belongs_to :declaration
    belongs_to :assigned_tax_code
    has_many :declaration_checks
    has_many :checks, through: :declaration_checks
end
