require 'test_helper'

class Api::JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_journal_entries_index_url
    assert_response :success
  end

  test "should get create" do
    get api_journal_entries_create_url
    assert_response :success
  end

end
