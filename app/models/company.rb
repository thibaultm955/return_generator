class Company < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :entities, dependent: :destroy
    has_many :declarations, through: :entities
    has_many :assigned_tax_codes, through: :entities
    validates :name, presence: true
end
