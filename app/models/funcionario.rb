class Funcionario < ApplicationRecord
  has_and_belongs_to_many :atendimentos
end
