class User < ApplicationRecord
  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
