class FuncionariosController < AdminController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.present? && current_user.can_access?(@funcionario)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionário cadastrado com sucesso." }
      else
        format.html { redirect_to root_path, alert: "Acesso negado." }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionario editado com sucesso." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionario excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
end
# Use callbacks to share common setup or constraints between actions.
def set_funcionario
  @funcionario = Funcionario.find_by(id: params[:id])
  if @funcionario.nil?
    redirect_to funcionarios_path, notice: "Funcionário não encontrado."
  end


  # Only allow a list of trusted parameters through.
  def funcionario_params
    params.require(:funcionario).permit(:matricula, :nome, :cargo, :email, :salario, :data_admissao, :cpf)
  end
end