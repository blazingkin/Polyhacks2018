require 'test_helper'

class JobControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "job creation" do
    get '/auth/test/callback', params: {id: parents(:one).id }
    assert_difference 'JobListing.count', +1 do
      post job_new_path, params: {info: 'This is a sample'}
      assert_response :redirect
    end
  end

end
