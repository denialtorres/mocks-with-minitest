require 'test_helper'
require 'minitest/mock'

class UserTest < ActiveSupport::TestCase
  test "geocode" do
    user = users(:one)

    mock = Minitest::Mock.new
    # first arguments -> method to be call
    # second argument -> return value
    # last argument -> parameter pass in
    mock.expect :geocode, [1, -1], [user.address]

    user.geocode(service: mock)

    assert_equal 1, user.latitude
    assert_equal -1, user.longitude

    # helper to make sure that it call the geocode method in mock
    # and that use the parameters
    assert_mock mock
  end
end
