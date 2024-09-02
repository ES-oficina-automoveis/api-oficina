class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]

  # GET /atendimentos or /atendimentos.json
  def index
    if current_user.admin?
      @atendimentos = Atendimento.all
    else
      @atendimentos = Atendimento.joins(:veiculo)
                                 .where(veiculos: { cliente_id: current_user.cliente_id })
    end
  end

  # GET /atendimentos/1 or /atendimentos/1.json
  def show
  end

  # GET /atendimentos/new
  def new
    @atendimento = Atendimento.new
  end

  # GET /atendimentos/1/edit
  def edit
  end

  # POST /atendimentos or /atendimentos.json
  def create
    @atendimento = Atendimento.new(atendimento_params)

    respond_to do |format|
      if @atendimento.save
        AtendimentoMailer.atendimento_criado(@atendimento).deliver_later
        format.html { redirect_to atendimento_url(@atendimento), notice: "Atendimento cadastrado com sucesso." }
        format.json { render :show, status: :created, location: @atendimento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atendimentos/1 or /atendimentos/1.json
  def update
    respond_to do |format|
      if @atendimento.update(atendimento_params)
        format.html { redirect_to atendimento_url(@atendimento), notice: "Atendimento editado com sucesso." }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendimentos/1 or /atendimentos/1.json
  def destroy
    @atendimento.destroy!

    respond_to do |format|
      format.html { redirect_to atendimentos_url, notice: "Atendimento excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atendimento
      @atendimento = Atendimento.includes(veiculo: :cliente).find_by(id: params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to atendimentos_path, notice: "Atendimento não encontrado."
    end

    # Only allow a list of trusted parameters through.
    def atendimento_params
      params.require(:atendimento).permit(:data_inicio, :data_termino, :status, :veiculo_id, funcionario_ids: [])
    end
end
