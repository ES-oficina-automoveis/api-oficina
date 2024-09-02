class PecasController < AdminController
  before_action :set_peca, only: %i[ show edit update destroy ]

  # GET /pecas or /pecas.json
  def index
    @pecas = Peca.all
  end

  # GET /pecas/1 or /pecas/1.json
  def show
  end

  # GET /pecas/new
  def new
    @peca = Peca.new
  end

  # GET /pecas/1/edit
  def edit
  end

  # POST /pecas or /pecas.json
  def create
    @peca = Peca.new(peca_params)

    respond_to do |format|
      if @peca.present? && current_user.can_access?(@peca)
        format.html { redirect_to peca_url(@peca), notice: "Peça cadastrada com sucesso." }
      else
        format.html { redirect_to root_path, alert: "Acesso negado." }
      end
    end
  end

  # PATCH/PUT /pecas/1 or /pecas/1.json
  def update
    respond_to do |format|
      if @peca.update(peca_params)
        format.html { redirect_to peca_url(@peca), notice: "Peça atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @peca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @peca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pecas/1 or /pecas/1.json
  def destroy
    @peca.destroy!

    respond_to do |format|
      format.html { redirect_to pecas_url, notice: "Peça excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private
end
# Use callbacks to share common setup or constraints between actions.
def set_peca
  @peca = Peca.find_by(id: params[:id])
  if @peca.nil?
    redirect_to pecas_path, notice: "Peça não encontrada."
  end


  # Only allow a list of trusted parameters through.
  def peca_params
    params.require(:peca).permit(:codigo, :nome, :preco, :tipo, :fabricante, :data_validade)
  end
end
