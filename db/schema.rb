# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_08_17_220636) do
  create_table "administradors", force: :cascade do |t|
    t.string "email"
    t.string "senha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atendimentos", force: :cascade do |t|
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "veiculo_id", null: false
    t.index ["veiculo_id"], name: "index_atendimentos_on_veiculo_id"
  end

  create_table "atendimentos_funcionarios", id: false, force: :cascade do |t|
    t.integer "atendimento_id", null: false
    t.integer "funcionario_id", null: false
    t.index ["atendimento_id"], name: "index_atendimentos_funcionarios_on_atendimento_id"
    t.index ["funcionario_id"], name: "index_atendimentos_funcionarios_on_funcionario_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.string "cpf"
    t.string "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estoques", force: :cascade do |t|
    t.string "codigo"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estoques_pecas", id: false, force: :cascade do |t|
    t.integer "estoque_id", null: false
    t.integer "peca_id", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "matricula"
    t.string "nome"
    t.string "cargo"
    t.string "email"
    t.decimal "salario"
    t.date "data_admissao"
    t.string "cpf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pecas", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.decimal "preco"
    t.string "tipo"
    t.string "fabricante"
    t.date "data_validade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.text "descricao"
    t.decimal "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "veiculos", force: :cascade do |t|
    t.string "placa"
    t.string "modelo"
    t.integer "ano"
    t.string "cor"
    t.float "quilometragem"
    t.string "chassi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id", null: false
    t.index ["cliente_id"], name: "index_veiculos_on_cliente_id"
  end

  add_foreign_key "atendimentos", "veiculos"
  add_foreign_key "veiculos", "clientes"
end
