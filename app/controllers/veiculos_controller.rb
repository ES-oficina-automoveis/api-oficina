class VeiculosController < ApplicationController
  before_action :set_veiculo, only: %i[ show edit update destroy ]

  # GET /veiculos or /veiculos.json
  def index
    @veiculos = Veiculo.all
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

    respond_to do |format|
      if @veiculo.present? && current_user.can_access?(@veiculo)
        format.html { redirect_to veiculo_url(@veiculo), notice: "Veículo cadastrado com sucesso." }
      else
        format.html { redirect_to root_path, alert: "Acesso negado." }
      end
    end
  end

  # PATCH/PUT /veiculos/1 or /veiculos/1.json
  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to veiculo_url(@veiculo), notice: "Veiculo editado com sucesso." }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1 or /veiculos/1.json
  begin
    @veiculo.destroy!
    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: "Veículo excluído com sucesso." }
      format.json { head :no_content }
    end
  rescue ActiveRecord::RecordNotDestroyed => e
    respond_to do |format|
      format.html { redirect_to veiculos_url, alert: "Erro ao excluir o veículo: #{e.message}" }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end


  private
end
# Use callbacks to share common setup or constraints between actions.
def set_veiculo
  @veiculo = Veiculo.find_by(id: params[:id])
  if @veiculo.nil?
    redirect_to veiculos_path, notice: "Veículo não encontrado."
  end

  # Only allow a list of trusted parameters through.
  def veiculo_params
    params.require(:veiculo).permit(:placa, :modelo, :ano, :cor, :quilometragem, :chassi, :cliente_id)
  end
end
