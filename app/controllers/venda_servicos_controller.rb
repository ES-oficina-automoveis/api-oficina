class VendaServicosController < ApplicationController
  before_action :set_venda_servico, only: %i[ show edit update destroy ]

  # GET /venda_servicos or /venda_servicos.json
  def index
    @venda_servicos = VendaServico.includes(:cliente, :veiculo, :servico).all
  end

  # GET /venda_servicos/1 or /venda_servicos/1.json
  def show
  end

  # GET /venda_servicos/new
  def new
    @venda_servico = VendaServico.new
  end

  # GET /venda_servicos/1/edit
  def edit
  end

  # POST /venda_servicos or /venda_servicos.json
  def create
    @venda_servico = VendaServico.new(venda_servico_params)

    respond_to do |format|
      if @venda_servico.save
        format.html { redirect_to venda_servico_url(@venda_servico), notice: "Venda servico was successfully created." }
        format.json { render :show, status: :created, location: @venda_servico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venda_servicos/1 or /venda_servicos/1.json
  def update
    respond_to do |format|
      if @venda_servico.update(venda_servico_params)
        format.html { redirect_to venda_servico_url(@venda_servico), notice: "Venda servico was successfully updated." }
        format.json { render :show, status: :ok, location: @venda_servico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda_servico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venda_servicos/1 or /venda_servicos/1.json
  begin
    @venda_servico.destroy!
    respond_to do |format|
      format.html { redirect_to venda_servicos_url, notice: I18n.t('notices.venda_servico_destroyed') }
      format.json { head :no_content }
    end
  rescue ActiveRecord::RecordNotDestroyed => e
    respond_to do |format|
      format.html { redirect_to venda_servicos_url, alert: "Erro ao excluir a venda: #{e.message}" }
      format.json { render json: { error: e.message }, status: :unprocessable_entity }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_venda_servico
    @venda_servico = VendaServico.find_by(id: params[:id])
    if @venda_servico.nil?
      redirect_to venda_servicos_path, notice: "Venda não encontrada."
    end
  end

  # Only allow a list of trusted parameters through.
    def venda_servico_params
      params.require(:venda_servico).permit(:servico_id, :veiculo_id, :cliente_id)
    end
end
