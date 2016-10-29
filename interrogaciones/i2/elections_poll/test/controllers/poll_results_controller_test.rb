require 'test_helper'

class PollResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get poll_results_index_url
    assert_response :success
  end

end
