require 'test_helper'

class DataEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_entry = data_entries(:one)
  end

  test "should get index" do
    get data_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_data_entry_url
    assert_response :success
  end

  test "should create data_entry" do
    assert_difference('DataEntry.count') do
      post data_entries_url, params: { data_entry: { altitude: @data_entry.altitude, latitude: @data_entry.latitude, longitude: @data_entry.longitude, notes: @data_entry.notes, outside: @data_entry.outside, temperature: @data_entry.temperature, temperature_unit: @data_entry.temperature_unit } }
    end

    assert_redirected_to data_entry_url(DataEntry.last)
  end

  test "should show data_entry" do
    get data_entry_url(@data_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_entry_url(@data_entry)
    assert_response :success
  end

  test "should update data_entry" do
    patch data_entry_url(@data_entry), params: { data_entry: { altitude: @data_entry.altitude, latitude: @data_entry.latitude, longitude: @data_entry.longitude, notes: @data_entry.notes, outside: @data_entry.outside, temperature: @data_entry.temperature, temperature_unit: @data_entry.temperature_unit } }
    assert_redirected_to data_entry_url(@data_entry)
  end

  test "should destroy data_entry" do
    assert_difference('DataEntry.count', -1) do
      delete data_entry_url(@data_entry)
    end

    assert_redirected_to data_entries_url
  end
end
