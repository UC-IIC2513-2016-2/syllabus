class TrojansController < ApplicationController
  before_action :set_trojan, only: [:show, :edit, :update, :destroy]

  # GET /trojans
  # GET /trojans.json
  def index
    @trojans = Trojan.all
  end

  # GET /trojans/1
  # GET /trojans/1.json
  def show
  end

  # GET /trojans/new
  def new
    @trojan = Trojan.new
  end

  # GET /trojans/1/edit
  def edit
  end

  # POST /trojans
  # POST /trojans.json
  def create
    @trojan = Trojan.new(trojan_params)

    respond_to do |format|
      if @trojan.save
        format.html do
          if request.xhr?
            render partial: 'created_successfully'
          else
            redirect_to @trojan, notice: 'Trojan was successfully created.'
          end
        end
        format.json { render :show, status: :created, location: @trojan }
      else
        format.html do
          if request.xhr?
            render partial: 'form', locals: { trojan: @trojan }
          else
            render :new
          end
        end
        format.json { render json: @trojan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trojans/1
  # PATCH/PUT /trojans/1.json
  def update
    respond_to do |format|
      if @trojan.update(trojan_params)
        format.html { redirect_to @trojan, notice: 'Trojan was successfully updated.' }
        format.json { render :show, status: :ok, location: @trojan }
      else
        format.html { render :edit }
        format.json { render json: @trojan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trojans/1
  # DELETE /trojans/1.json
  def destroy
    @trojan.destroy
    respond_to do |format|
      format.html { redirect_to trojans_url, notice: 'Trojan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trojan
      @trojan = Trojan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trojan_params
      params.require(:trojan).permit(:name)
    end
end
