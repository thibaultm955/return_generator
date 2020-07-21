class Declaration < ApplicationRecord
    belongs_to :entity
    has_many :transactions
    has_many :declaration_checks, through: :transactions
end
