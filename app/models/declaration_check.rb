class DeclarationCheck < ApplicationRecord
    belongs_to :transaction
    belongs_to :check
end
