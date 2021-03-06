class UsersSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email

  has_many :appointments
  has_many :restaurants, through: :appointments
end
