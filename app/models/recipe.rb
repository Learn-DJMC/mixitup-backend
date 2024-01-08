class Recipe < ApplicationRecord
    has_many :comments
    belongs_to :user

    validates :title, :category, :dietary_restrictions, :rating, :description, :ingredients, :instructions, :image, :user_id, presence: true
end
