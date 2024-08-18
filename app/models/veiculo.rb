class Veiculo < ApplicationRecord
  belongs_to :cliente
  has_many :atendimentos

  validates :placa, presence: true, uniqueness: true, length: { minimum: 7, maximum: 7 }
  validates :modelo, presence: true, length: { minimum: 3, maximum: 30 }
  validates :ano, presence: true, numericality: { only_integer: true }
  validates :cor, presence: true, length: { minimum: 3, maximum: 15 }
  validates :quilometragem, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :chassi, presence: true, length: { minimum: 17, maximum: 17 }

end
