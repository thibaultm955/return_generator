class DueDate < ApplicationRecord
    has_many :declarations, class_name: "declaration", foreign_key: "reference_id"
end
