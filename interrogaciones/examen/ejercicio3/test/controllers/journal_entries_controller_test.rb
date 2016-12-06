require 'test_helper'

class JournalEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @journal_entry = journal_entries(:one)
  end

  test "should get index" do
    get journal_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_journal_entry_url
    assert_response :success
  end

  test "should create journal_entry" do
    assert_difference('JournalEntry.count') do
      post journal_entries_url, params: { journal_entry: { feeling: @journal_entry.feeling, position: @journal_entry.position, text: @journal_entry.text, timestamp: @journal_entry.timestamp, user_id: @journal_entry.user_id } }
    end

    assert_redirected_to journal_entry_url(JournalEntry.last)
  end

  test "should show journal_entry" do
    get journal_entry_url(@journal_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_journal_entry_url(@journal_entry)
    assert_response :success
  end

  test "should update journal_entry" do
    patch journal_entry_url(@journal_entry), params: { journal_entry: { feeling: @journal_entry.feeling, position: @journal_entry.position, text: @journal_entry.text, timestamp: @journal_entry.timestamp, user_id: @journal_entry.user_id } }
    assert_redirected_to journal_entry_url(@journal_entry)
  end

  test "should destroy journal_entry" do
    assert_difference('JournalEntry.count', -1) do
      delete journal_entry_url(@journal_entry)
    end

    assert_redirected_to journal_entries_url
  end
end
