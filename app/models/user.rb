class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :restaurants, through: :appointments
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }
end
