class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[ show edit update destroy ]
  before_action :load_clientes, only: %i[ new create edit update ]

  # GET /veiculos or /veiculos.json
  def index
    if current_user.admin?
      @veiculos = Veiculo.all
    else
      @veiculos = current_user.cliente.veiculos
    end
  end

  # GET /veiculos/1 or /veiculos/1.json
  def show
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
  end

  # GET /veiculos/1/edit
  def edit
  end

  # POST /veiculos or /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)

    unless current_user.admin?
      @veiculo.cliente_id = current_user.cliente_id
    end

    handle_save(@veiculo.save, :new, "Veículo cadastrado com sucesso.")
  end


  # PATCH/PUT /veiculos/1 or /veiculos/1.json
  def update
    unless current_user.admin?
      @veiculo.cliente_id = current_user.cliente_id
    end

    handle_save(@veiculo.update(veiculo_params), :edit, "Veículo editado com sucesso.")
  end

  # DELETE /veiculos/1 or /veiculos/1.json
  def destroy
    handle_destroy(@veiculo, "Veículo excluído com sucesso.")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_veiculo
    @veiculo = Veiculo.find_by(id: params[:id])
    if @veiculo.nil?
      redirect_to veiculos_path, notice: "Veículo não encontrado."
    end
  end

  def load_clientes
    @clientes = current_user.admin? ? Cliente.all : Cliente.where(id: current_user.cliente_id)
  end

  # Only allow a list of trusted parameters through.
  def veiculo_params
    params.require(:veiculo).permit(:placa, :modelo, :ano, :cor, :quilometragem, :chassi, :cliente_id)
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to veiculo_url(@veiculo), notice: notice_message }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end
  def handle_destroy(veiculo, success_message)
    respond_to do |format|
      begin
        veiculo.destroy!
        format.html { redirect_to veiculos_url, notice: success_message }
        format.json { head :no_content }
      rescue ActiveRecord::InvalidForeignKey => e
        error_message = "Não é possível excluir o veículo devido a associações existentes."
        format.html { redirect_to veiculos_url, alert: error_message }
        format.json { render json: { error: error_message }, status: :unprocessable_entity }
      end
    end
  end
end
