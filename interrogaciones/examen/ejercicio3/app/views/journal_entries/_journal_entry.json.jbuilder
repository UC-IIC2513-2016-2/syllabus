json.extract! journal_entry, :id, :text, :feeling, :timestamp, :position, :user_id, :created_at, :updated_at
json.url journal_entry_url(journal_entry, format: :json)