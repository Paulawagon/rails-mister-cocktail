class Ingredient < ApplicationRecord
    has_many :cocktails, dependent: :destroy
end
