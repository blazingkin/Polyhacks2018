require 'test_helper'

class ChatControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "list should work" do
    get '/auth/test/callback', params: {id: parents(:one).id }
    get '/messages'
    assert_response :ok
  end

end
