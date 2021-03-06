# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :chef, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :business_hour_begin
    validates :business_hour_end
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :age_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  validate :business_hour_cannot_be_the_same

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :gender
  belongs_to_active_hash :age
  belongs_to_active_hash :genre

  def business_hour_cannot_be_the_same
    errors.add(:business_hour_begin, 'cannot be equal to business hour end') if business_hour_begin == business_hour_end
  end
end
