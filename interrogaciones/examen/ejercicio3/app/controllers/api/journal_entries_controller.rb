module Api
  class JournalEntriesController < ApiController
    before_action :authenticate, only: [:create]

    def index
      render json: JournalEntryManager.new.get_feed
    end

    def create
      journal_entry = JournalEntry.new(journal_entry_params)
      if journal_entry.save
        render json: journal_entry, status: :created
      else
        render json: { errors: journal_entry.errors }, status: :unprocessable_entity
      end
    end

    private

    def journal_entry_params
      params.require(:journal_entry).permit(:text, :feeling, :timestamp, :position, :user_id)
    end
  end
end
