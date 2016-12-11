class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(user_id: current_user.id, refrigerator_id: params["refrigerator_id"])
    respond_to do |format|
      if @list.save
        if @list.refrigerator_id
          format.json { render status: :created, json: @list }
          format.html { redirect_to bulletin_boards_path, notice: 'リストを新規作成しました。' }
        else
          #format.html { redirect_to events_path, notice: 'リストを新規作成しました。' }
          format.json { render events_path, status: :created, location: @list }
        end
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update_attributes(delete_flag: params["delete_flag"])
        format.html { redirect_to @list, notice: 'リストを更新しました。' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.update_attributes(delete_flag: true)
    if @list.event_id
      redirect_to events_path
    else
      redirect_to bulletin_boards_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:refrigerator_id, :user_id, :event_id, :delete_flag)
    end
end
