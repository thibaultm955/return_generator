class AssignedTaxCode < ApplicationRecord
    belongs_to :tax_code
    belongs_to :entity
end