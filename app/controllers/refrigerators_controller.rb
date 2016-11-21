class RefrigeratorsController < ApplicationController
  before_action :set_refrigerator, only: [:show, :edit, :update, :switching]

  # GET /refrigerators
  # GET /refrigerators.json
  def index
    @refrigerators1 = Refrigerator.where(user_id: current_user.id).where.not(deadline: nil).order("deadline")
    @refrigerators2 = Refrigerator.where(user_id: current_user.id).where(deadline: nil).order("purchase")
  end

  # GET /refrigerators/1
  # GET /refrigerators/1.json
  def show
    redirect_to action: "index"
  end

  # GET /refrigerators/new
  def new
    @refrigerator = Refrigerator.new
  end

  # GET /refrigerators/1/edit
  def edit
    @linenil = 1 if @refrigerator.deadline == nil
  end

  # POST /refrigerators
  # POST /refrigerators.json
  def create
    @refrigerator = Refrigerator.new(refrigerator_params)
    @refrigerator.deadline = nil if params[:line]
    @refrigerator.purchase = Date.today
    respond_to do |format|
      if @refrigerator.save
        format.html { redirect_to @refrigerator, notice: '冷蔵庫に新しい食材が追加されました。' }
        format.json { render :show, status: :created, location: @refrigerator }
      else
        format.html { render :new }
        format.json { render json: @refrigerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refrigerators/1
  # PATCH/PUT /refrigerators/1.json
  def update
    respond_to do |format|
      if @refrigerator.update(refrigerator_params)
        @refrigerator.update_attributes(deadline: nil) if params[:line]
        format.html { redirect_to @refrigerator, notice: '冷蔵庫の中身を更新しました。' }
        format.json { render :show, status: :ok, location: @refrigerator }
      else
        format.html { render :edit }
        format.json { render json: @refrigerator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refrigerators/1
  # DELETE /refrigerators/1.json
  def destroy
    @refrigerator.destroy
    respond_to do |format|
      format.html { redirect_to refrigerators_url, notice: 'グッバイ食材。' }
      format.json { head :no_content }
    end
  end
  
  
  def delete
      if params[:candidate]
        params[:candidate][:id].each do |refrigerator_id|
            @refrigerator = Refrigerator.find(refrigerator_id)
            @refrigerator.destroy
        end
      end
      redirect_to action: "index"
  end

  def switching
    if params[:rele]
      @refrigerator.update_attributes(release: (@refrigerator.release+1)%2 ,change: DateTime.now)
    else
      @refrigerator.update_attributes(quantity: @refrigerator.quantity - 1)
    end
    redirect_to action: "index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refrigerator
      @refrigerator = Refrigerator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refrigerator_params
        params.require(:refrigerator).permit(:user_id, :name, :quantity, :purchase, :deadline, :release)
    end
end
