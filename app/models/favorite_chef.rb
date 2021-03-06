# frozen_string_literal: true

class FavoriteChef < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :chef, optional: true
end
