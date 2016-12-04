class JournalEntriesService
  # el enunciado indica otro host, pero dejaremos "localhost" para que el ejemplo pueda funcionar localmente
  API_PATH = 'http://localhost:3000/api/journal_entries'

  def get_all
    journal_entries = JSON.parse(RestClient.get(API_PATH).body)
    # Esta transformación no es necesario realizarla como parte de la pregunta.
    # Aquí está hecha (y "a la rápida") sólo para evitar cambiar la vista (que espera instancias de JournalEntry en lugar de hashes)
    journal_entries.map do |journal_entry|
      journal_entry['user_id'] = journal_entry['user']['id']
      journal_entry.delete('user')
      JournalEntry.new(journal_entry)
    end
  end

  def create(journal_entry_params, current_user)
    response = RestClient.post(API_PATH, { journal_entry: journal_entry_params.to_unsafe_hash }, { 'Authorization' => "Token token=#{current_user.token}" })
    json = JSON.parse(response.body)
    # Esta transformación no es necesario realizarla como parte de la pregunta.
    # Aquí está hecha (y "a la rápida") sólo para evitar cambiar la vista (que espera instancias de JournalEntry en lugar de hashes)
    unless json.key?('errors')
      json['user_id'] = json['user']['id']
      json.delete('user')
    end
    json
  end
end
