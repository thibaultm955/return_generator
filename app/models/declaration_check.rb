class DeclarationCheck < ApplicationRecord
    belongs_to :transaction
    belongs_to :check
    belongs_to :due_date
end
