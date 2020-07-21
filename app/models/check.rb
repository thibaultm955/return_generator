class Check < ApplicationRecord
    has_many :declaration_checks
    has_many :transactions, through: :declaration_checks
end
