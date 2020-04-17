class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :cocktail, :ingredient, presence: true

  # validates :ingredient, uniqueness: true
  # for one cocktail, you can't have 2 instances of ingredients as connected via dose. It works if you reverse the order. (Dose is unique for a given cocktail/ingredient couple)

  validates :ingredient, uniqueness: { scope: :cocktail }

  # Another example:
  # validates :first_name, uniqueness: { scope: :last_name }
  # in regards to name, you can have multiple same first_names, or multiple same last_names, but you can't have multiple of the same first_name linked to the same last_name.
end
