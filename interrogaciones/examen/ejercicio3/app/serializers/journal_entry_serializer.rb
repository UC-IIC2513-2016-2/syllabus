class JournalEntrySerializer < ActiveModel::Serializer
  attributes :id, :text, :feeling, :timestamp, :position, :user
end
