# frozen_string_literal: true

class Chef < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'needs to be filled in like 000-0000' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :district
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'must include alphabet and numbers' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_one :profile
  has_many :dishes
  has_many :favorite_chefs
  has_many :users, through: :favorite_chefs
  has_many :likes, through: :dishes
end
