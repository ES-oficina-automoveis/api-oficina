class User < ApplicationRecord
  belongs_to :cliente, optional: true

  enum :role, [ :cliente, :admin ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
