class Entity < ApplicationRecord
    belongs_to :company
    has_many :assigned_tax_codes
    has_many :declarations
    has_many :transactions, through: :declarations
end
