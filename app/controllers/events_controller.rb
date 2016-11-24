class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :addition]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @myrefri = Refrigerator.where(user_id: current_user.id).where(event_id: nil)
  end

  # GET /events/new
  def new
    @event = Event.new
    @myrefri = Refrigerator.where(user_id: current_user.id).where(event_id: nil)
  end

  # GET /events/1/edit
  def edit
    @myrefri = Refrigerator.where(user_id: current_user.id).where(event_id: [nil, @event.id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)


    respond_to do |format|
      if @event.save
        params[:refri][:id].each do |refrigerator_id|
          @refrigerator = Refrigerator.find(refrigerator_id)
          @refrigerator.update_attributes(event_id: @event.id)
        end
        format.html { redirect_to @event, notice: '新しいイベントを作成しました。' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'イベントを更新しました。' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'イベントを削除しました。' }
      format.json { head :no_content }
    end
  end

  def addition
    @refrigerator = Refrigerator.find(params[:refri])
    if params[:dele]
      @refrigerator.update_attributes(event_id: nil)
    else
      @refrigerator.update_attributes(event_id: @event.id)
    end
    redirect_to action: "show"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:refrigerator_id, :place, :date, :upper_num, :lower_num)
    end
end
