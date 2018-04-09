class FigurinhasController < ApplicationController
  before_action :set_figurinha, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /figurinhas
  # GET /figurinhas.json
  def index
    @figurinhas = current_user.figurinhas
  end

  # GET /figurinhas/1
  # GET /figurinhas/1.json
  def show
  end

  # GET /figurinhas/new
  def new
    @figurinha = Figurinha.new
  end

  # GET /figurinhas/1/edit
  def edit
  end

  # POST /figurinhas
  # POST /figurinhas.json
  def create
    figurinhas_antigas = {}
    figurinhas_novas = {}
    current_user.figurinhas.each do |fig|
      figurinhas_antigas[fig.numero] = fig
    end

    params.permit![:text_numeros].first.scan(/\d{1,3}/).map(&:to_i).each do |numero|
      if figurinhas_antigas.key?(numero)
        figurinhas_antigas[numero][:quantidade] += 1
      else
        if figurinhas_novas.key?(numero)
          figurinhas_novas[numero][:quantidade] += 1
        else
          figurinhas_novas[numero] = {
            numero: numero,
            figurinha_info_id: numero + 1,
            quantidade: 1,
            user_id: current_user.id
          }
        end
      end
    end

    respond_to do |format|
      if figurinhas_record = Figurinha.create(figurinhas_novas.values) && figurinhas_antigas.values.each(&:save)
        format.html { redirect_to '/figurinhas', notice: 'As figurinhas foram adicionadas.' }
        format.json { render :show, status: :created, location: '/figurinhas' }
      else
        format.html { render :new }
        format.json { render json: figurinhas_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /figurinhas/1
  # PATCH/PUT /figurinhas/1.json
  def update
    respond_to do |format|
      if @figurinha.update(figurinha_params)
        format.html { redirect_to @figurinha, notice: 'Figurinha was successfully updated.' }
        format.json { render :show, status: :ok, location: @figurinha }
      else
        format.html { render :edit }
        format.json { render json: @figurinha.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /figurinhas/1
  # DELETE /figurinhas/1.json
  def destroy
    @figurinha.destroy
    respond_to do |format|
      format.html { redirect_to figurinhas_url, notice: 'Figurinha was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_one
    figurinha = Figurinha.find(params.permit![:figurinha_id])
    figurinha.quantidade += 1

    respond_to do |format|
      if figurinha.save
        format.html { redirect_to '/figurinhas', notice: 'Quantidade atualizada' }
        format.json { render :show, status: :created, location: '/figurinhas' }
      else
        format.html { render :new }
        format.json { render json: figurinha.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_one
    figurinha = Figurinha.find(params.permit![:figurinha_id])
    figurinha.quantidade -= 1

    if figurinha.quantidade < 1
      respond_to do |format|
        if figurinha.delete
          format.html { redirect_to '/figurinhas', notice: 'Figurinha removida' }
          format.json { render :show, status: :created, location: '/figurinhas' }
        else
          format.html { render :new }
          format.json { render json: figurinha.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if figurinha.save
          format.html { redirect_to '/figurinhas', notice: 'Quantidade atualizada' }
          format.json { render :show, status: :created, location: '/figurinhas' }
        else
          format.html { render :new }
          format.json { render json: figurinha.errors, status: :unprocessable_entity }
        end
      end
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_figurinha
      @figurinha = Figurinha.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def figurinha_params
      params.require(:figurinha).permit(:numero, :quantidade, :user_id)
    end
end
