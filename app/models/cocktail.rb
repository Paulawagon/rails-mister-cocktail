class Cocktail < ApplicationRecord
    has_many :doses, dependent: :destroy
    validates :name, presence: true
    validates :name, uniqueness: true
end
