class JournalEntriesController < ApplicationController
  before_action :set_journal_entry, only: [:show, :edit, :update, :destroy]

  # GET /journal_entries
  # GET /journal_entries.json
  def index
    @journal_entries = JournalEntriesService.new.get_all
  end

  # GET /journal_entries/1
  # GET /journal_entries/1.json
  def show
  end

  # GET /journal_entries/new
  def new
    @journal_entry = JournalEntry.new
  end

  # GET /journal_entries/1/edit
  def edit
  end

  # POST /journal_entries
  # POST /journal_entries.json
  def create
    journal_entry_response = JournalEntriesService.new.create(journal_entry_params, current_user)
    # dependiendo de la respuesta de la API, hay que detectar el caso de error
    if journal_entry_response.key?('errors')
      # no es necesario hacer esto de esta forma, pues la vista podría también prepararse para recibir la respuesta de la API
      # o bien construir algún otro wrapper para la misma (usar ActiveRecord aquí no tiene mucho sentido si vamos a usar la API)
      @journal_entry = JournalEntry.new(journal_entry_params)
      @journal_entry.errors.add(journal_entry_response.errors)
      render :new
    else
      @journal_entry = JournalEntry.new(journal_entry_response)
      redirect_to @journal_entry, notice: 'Journal entry was successfully created.'
    end
  end

  # PATCH/PUT /journal_entries/1
  # PATCH/PUT /journal_entries/1.json
  def update
    respond_to do |format|
      if @journal_entry.update(journal_entry_params)
        format.html { redirect_to @journal_entry, notice: 'Journal entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal_entry }
      else
        format.html { render :edit }
        format.json { render json: @journal_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_entries/1
  # DELETE /journal_entries/1.json
  def destroy
    @journal_entry.destroy
    respond_to do |format|
      format.html { redirect_to journal_entries_url, notice: 'Journal entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journal_entry
      @journal_entry = JournalEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_entry_params
      params.require(:journal_entry).permit(:text, :feeling, :timestamp, :position, :user_id)
    end
end
