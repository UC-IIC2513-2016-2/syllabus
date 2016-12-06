class JournalEntryManager
  def get_feed
    JournalEntry.limit(10)
  end
end
