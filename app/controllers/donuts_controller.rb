class DonutsController < ApplicationController
  before_action :set_donut, only: [:show, :edit, :update, :destroy, :picture, :fab, :unfab]

  # GET /donuts
  # GET /donuts.json
  def index
    @donuts = Donut.all
  end

  def myfavo
    @fabs = Fab.where(user_id: current_user.id)
  end

  def mydonut
    @donuts = Donut.where(user_id: current_user.id)
  end


  # GET /donuts/1
  # GET /donuts/1.json
  def show
    if params[:format].in?(["jpg","png","gif"])
      picture
    end
  end

  # GET /donuts/new
  def new
    @donut = Donut.new
  end

  # GET /donuts/1/edit
  def edit
 
  end

  # POST /donuts
  # POST /donuts.json
  def create
    @donut = Donut.new(donut_params)

    respond_to do |format|
      if @donut.save
        format.html { redirect_to @donut, notice: 'レシピの新規作成を完了しました。' }
        format.json { render :show, status: :created, location: @donut }
      else
        format.html { render :new }
        format.json { render json: @donut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /donuts/1
  # PATCH/PUT /donuts/1.json
  def update
    respond_to do |format|
      if @donut.update(donut_params)
        format.html { redirect_to @donut, notice: 'レシピの更新を完了しました。' }
        format.json { render :show, status: :ok, location: @donut }
      else
        format.html { render :edit }
        format.json { render json: @donut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donuts/1
  # DELETE /donuts/1.json
  def destroy
    @donut.destroy
    respond_to do |format|
      format.html { redirect_to donuts_url, notice: 'レシピの削除が完了しました。' }
      format.json { head :no_content }
    end
  end


  def search
    @donuts = Donut.search(params[:q])
    render "index"
  end

  def fab
    Fab.new(donut_id: @donut.id, user_id: current_user.id).save
    redirect_to :back
  end

  def unfab
    Fab.find_by(donut_id: @donut.id, user_id: current_user.id).destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donut
      @donut = Donut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donut_params
      params.require(:donut).permit(:user_id, :title, :material, :image)
    end

    #画像送信（picture_donut_path(@donut)でアクセス）
    def picture
      if @donut.data.present?
        send_data(@donut.data, :type => @donut.content_type, :disposition => 'inline')
      end
    end
end
